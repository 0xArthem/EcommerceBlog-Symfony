<?php

namespace App\Controller;

use App\Entity\Contact;
use App\Form\ContactType;
use App\Controller\ContactController;
use App\Repository\ArticleRepository;
use App\Repository\ProductRepository;
use App\Repository\CategoriesRepository;
use Knp\Component\Pager\PaginatorInterface;
use App\Repository\ArticleCategoryRepository;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

class HomeController extends AbstractController
{
    private $repoProduct;
    private $categoriesRepository;
    private $paginator;

    private $articleCategoryRepository;
    private $articleRepository;

    public function __construct(ArticleCategoryRepository $articleCategoryRepository,
    ArticleRepository $articleRepository, ProductRepository $repoProduct, CategoriesRepository $categoriesRepository, PaginatorInterface $paginator)
    {
        $this->repoProduct = $repoProduct;
        $this->categoriesRepository = $categoriesRepository;
        $this->paginator = $paginator;
        $this->articleCategoryRepository = $articleCategoryRepository;
        $this->articleRepository = $articleRepository;
    }

    /**
     * @Route("/", name="app_home")
     */
    public function index(Request $request): Response
    {
        $query = $this->repoProduct->findBy(array('isActive' => true), array('id' => 'DESC'));
        $products = $this->paginator->paginate(
            $query,
            $request->query->get('page', 1),
            12
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

        /*** blog */

        $articles = $this->articleRepository->findBy(array('isActive' => true), array('id' =>'DESC'), 1, 0);
        $articlesCategories = $this->articleCategoryRepository->findAll();

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
