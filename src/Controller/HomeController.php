<?php

namespace App\Controller;

use App\Repository\ArticleCategoryRepository;
use App\Repository\ArticleRepository;
use App\Repository\ProductRepository;
use App\Repository\CategoriesRepository;
use Knp\Component\Pager\PaginatorInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

class HomeController extends AbstractController
{
    /**
     * @Route("/", name="app_home")
     */
    public function index(ArticleCategoryRepository $articleCategoryRepository, ArticleRepository $articleRepository, ProductRepository $repoProduct, CategoriesRepository $categoriesRepository , PaginatorInterface $paginator, Request $request): Response
    {
        $query = $repoProduct->findBy(array('isActive' => true), array('id' => 'DESC'));
        $products = $paginator->paginate(
            $query,
            $request->query->get('page', 1),
            12
        );

        $categories = $categoriesRepository->findAll();

        $productBestSeller = $repoProduct->findBy(
            ['isBestSeller' => true, 'isActive' => true],
            ['id' => 'DESC'],
            3
        );
        $productNewArrival = $repoProduct->findBy([
            'isNewArrival' => true,
            'isActive' => true
        ]);
        $productFeatured = $repoProduct->findBy([
            'isFeatured' => true,
            'isActive' => true]);
        $productSpecialOffer = $repoProduct->findBy([
            'isSpecialOffer' => true,
            'isActive' => true
        ]);

        /*** blog */

        $articles = $articleRepository->findBy(array('isActive' => true), array('id' =>'DESC'), 1, 0);
        $articlesCategories = $articleCategoryRepository->findAll();

        return $this->render('home/index.html.twig', [
            'products' => $products,
            'productBestSeller' => $productBestSeller,
            'productNewArrival' => $productNewArrival,
            'productFeatured' => $productFeatured,
            'productSpecialOffer' => $productSpecialOffer,
            'categories' => $categories,
            'articles' => $articles,
            'articlesCategories' => $articlesCategories
        ]);
    }
}
