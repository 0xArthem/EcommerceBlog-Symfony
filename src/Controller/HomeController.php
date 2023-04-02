<?php

namespace App\Controller;

use App\Entity\Product;
use App\Repository\CategoriesRepository;
use App\Repository\ProductRepository;
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
        $query = $repoProduct->findAll();
        $products = $paginator->paginate(
            $query,
            $request->query->get('page', 1),
            12
        );

        $categories = $categoriesRepository->findAll();

        $productBestSeller = $repoProduct->findByIsBestSeller(1);
        $productNewArrival = $repoProduct->findByIsNewArrival(1);
        $productFeatured = $repoProduct->findByIsFeatured(1);
        $productSpecialOffer = $repoProduct->findByIsSpecialOffer(1);

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
    public function product_category($slug, ProductRepository $repoProduct, CategoriesRepository $categoriesRepository , PaginatorInterface $paginator, Request $request): Response
    {
        $category = $categoriesRepository->findOneBySlug($slug);

        return $this->render('home/product-category.html.twig', [
            'category' => $category
        ]);
    }
}
