<?php

namespace App\Controller;

use App\Repository\ProductRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

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
}
