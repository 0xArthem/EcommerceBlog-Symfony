<?php

namespace App\Controller;

use App\Entity\Product;
use App\Entity\ReviewsProduct;
use App\Form\ReviewsProductType;
use App\Repository\ProductRepository;
use App\Repository\CategoriesRepository;
use Knp\Component\Pager\PaginatorInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use EasyCorp\Bundle\EasyAdminBundle\Contracts\Orm\EntityPaginatorInterface;

class HomeController extends AbstractController
{
    /**
     * @Route("/", name="app_home")
     */
    public function index(ProductRepository $repoProduct, CategoriesRepository $categoriesRepository , PaginatorInterface $paginator, Request $request): Response
    {
        $query = $repoProduct->findBy(array('isActive' => true), array('id' => 'DESC'));
        $products = $paginator->paginate(
            $query,
            $request->query->get('page', 1),
            12
        );

        $categories = $categoriesRepository->findAll();

        $productBestSeller = $repoProduct->findBy([
            'isBestSeller' => true,
            'isActive' => true
        ]);
        $productNewArrival = $repoProduct->findBy([
            'isNewArrival' => true,
            'isActive' => true
        ]);
        $productFeatured = $repoProduct->findBy([
            'isFeatured' => true,
            'isActive' => true
        ]);
        $productSpecialOffer = $repoProduct->findBy([
            'isSpecialOffer' => true,
            'isActive' => true
        ]);

        return $this->render('home/index.html.twig', [
            'products' => $products,
            'productBestSeller' => $productBestSeller,
            'productNewArrival' => $productNewArrival,
            'productFeatured' => $productFeatured,
            'productSpecialOffer' => $productSpecialOffer,
            'categories' => $categories
        ]);
    }

     /**
     * @Route("/search", name="search_products")
     */
    public function searchProducts(Request $request, ProductRepository $productRepository)
    {
        $searchTerm = $request->query->get('search');
        $products = $productRepository->createQueryBuilder('p')
            ->where('p.name LIKE :searchTerm OR p.description LIKE :searchTerm')
            ->setParameter('searchTerm', '%'.$searchTerm.'%')
            ->getQuery()
            ->getResult();

        return $this->render('home/search.html.twig', [
            'products' => $products,
            'searchTerm' => $searchTerm,
        ]);
    }

    /**
     * @Route("/product/category/{slug}", name="product_category")
     */
    public function product_category($slug, ProductRepository $repoProduct, CategoriesRepository $categoriesRepository): Response
    {
        $category = $categoriesRepository->findOneBySlug($slug);

        return $this->render('home/product-category.html.twig', [
            'category' => $category
        ]);
    }

     /**
     * @Route("/product/{slug}", name="product")
     */
    public function product($slug, ProductRepository $repoProduct, Request $request): Response
    {
        $product = $repoProduct->findOneBySlug($slug);

        $review = new ReviewsProduct();
        $review->setProduct($product);
        $form = $this->createForm(ReviewsProductType::class, $review);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {

            $user = $this->getUser();
            $review = $form->getData();
            $review->setUser($user);
            $review->setProduct($product);

            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->persist($review);
            $entityManager->flush();

            return $this->redirectToRoute('product', ['slug' => $product->getSlug()]);
        }
        
        return $this->render('home/product.html.twig', [
            'product' => $product,
            'form' => $form->createView()
        ]);
    }
}
