<?php

namespace App\Controller;

use App\Entity\ReviewsProduct;
use App\Repository\ProductRepository;
use App\Repository\CategoriesRepository;
use Knp\Component\Pager\PaginatorInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use App\Form\ReviewsProductType;

class EcomController extends AbstractController
{
    private $repoProduct;
    private $categoriesRepository;
    private $paginator;

    public function __construct(ProductRepository $repoProduct, CategoriesRepository $categoriesRepository, PaginatorInterface $paginator)
    {
        $this->repoProduct = $repoProduct;
        $this->categoriesRepository = $categoriesRepository;
        $this->paginator = $paginator;
    }

    /**
     * @Route("/boutique", name="app_ecom")
     */
    public function index(Request $request): Response
    {
        $query = $this->repoProduct->findBy(array('isActive' => true), array('id' => 'DESC'));
        $products = $this->paginator->paginate(
            $query,
            $request->query->get('page', 1),
            20
        );

        $categories = $this->categoriesRepository->findAll();

        $productBestSeller = $this->repoProduct->findBy(
            ['isBestSeller' => true, 'isActive' => true],
            ['id' => 'DESC'],
            3
        );
        $productNewArrival = $this->repoProduct->findBy([
            'isNewArrival' => true,
            'isActive' => true
        ]);
        $productFeatured = $this->repoProduct->findBy([
            'isFeatured' => true,
            'isActive' => true]);
        $productSpecialOffer = $this->repoProduct->findBy([
            'isSpecialOffer' => true,
            'isActive' => true
        ]);

        return $this->render('ecom/index.html.twig', [
            'products' => $products,
            'productBestSeller' => $productBestSeller,
            'productNewArrival' => $productNewArrival,
            'productFeatured' => $productFeatured,
            'productSpecialOffer' => $productSpecialOffer,
            'categories' => $categories
        ]);
    }

    /**
     * @Route("/boutique/product/category/{slug}", name="product_category")
     */
    public function product_category($slug, Request $request): Response
    {
        $category = $this->categoriesRepository->findOneBySlug($slug);

        $query = $this->repoProduct->createQueryBuilder('p')
        ->leftJoin('p.category', 'c')
        ->where('c.id = :category_id')
        ->andWhere('p.isActive = :isActive')
        ->setParameter('category_id', $category->getId())
        ->setParameter('isActive', true)
        ->orderBy('p.id', 'DESC')
        ->getQuery()
        ->getResult();

        $products = $this->paginator->paginate(
            $query,
            $request->query->getInt('page', 1),
            12
        );

        return $this->render('home/product-category.html.twig', [
            'category' => $category,
            'products' => $products
        ]);
    }

     /**
     * @Route("/boutique/product/{slug}", name="product")
     */
    public function product($slug, Request $request): Response
    {
        $product = $this->repoProduct->findOneBySlug($slug);

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

     /**
     * @Route("/boutique/search", name="search_products")
     */
    public function searchProducts(Request $request)
    {
        $categories = $this->categoriesRepository->findAll();

        $searchTerm = $request->query->get('search');
        $products = $this->repoProduct->createQueryBuilder('p')
            ->where('p.name LIKE :searchTerm OR p.description LIKE :searchTerm')
            ->setParameter('searchTerm', '%'.$searchTerm.'%')
            ->orderBy('p.id', 'DESC')
            ->getQuery()
            ->getResult();

        return $this->render('home/search.html.twig', [
            'products' => $products,
            'searchTerm' => $searchTerm,
            'categories' => $categories
        ]);
    }
}
