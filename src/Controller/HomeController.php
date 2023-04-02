<?php

namespace App\Controller;

use App\Repository\ProductRepository;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

class HomeController extends AbstractController
{
    /**
     * @Route("/", name="app_home")
     */
    public function index(ProductRepository $repoProduct): Response
    {

        $products = $repoProduct->findAll();

        $productBestSeller = $repoProduct->findByIsBestSeller(1);
        $productNewArrival = $repoProduct->findByIsNewArrival(1);
        $productFeatured = $repoProduct->findByIsFeatured(1);
        $productSpecialOffer = $repoProduct->findByIsSpecialOffer(1);

        return $this->render('home/index.html.twig', [
            'products' => $products,
            'productBestSeller' => $productBestSeller,
            'productNewArrival' => $productNewArrival,
            'productFeatured' => $productFeatured,
            'productSpecialOffer' => $productSpecialOffer
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
}
