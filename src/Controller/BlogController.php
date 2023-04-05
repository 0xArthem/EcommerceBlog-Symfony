<?php

namespace App\Controller;

use App\Repository\ArticleRepository;
use Knp\Component\Pager\PaginatorInterface;
use App\Repository\ArticleCategoryRepository;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

class BlogController extends AbstractController
{
    private $articleCategoryRepository;
    private $articleRepository;
    private $paginator;

    public function __construct(
        ArticleCategoryRepository $articleCategoryRepository,
        ArticleRepository $articleRepository,
        PaginatorInterface $paginator
    )
    {
        $this->articleCategoryRepository = $articleCategoryRepository;
        $this->articleRepository = $articleRepository;
        $this->paginator = $paginator;
    }

    /**
     * @Route("/blog", name="app_blog")
     */
    public function index(Request $request): Response
    {
        $query = $this->articleRepository->findBy(array('isActive' => true), array('id' => 'DESC'));
        $allArticles = $this->paginator->paginate(
            $query,
            $request->query->get('page', 1),
            12
        );

        $articles = $this->articleRepository->findBy(array('isActive' => true), array('id' =>'DESC'), 1, 0);
        $articlesCategories = $this->articleCategoryRepository->findAll();

        return $this->render('blog/index.html.twig', [
            'articles' => $articles,
            'articlesCategories' => $articlesCategories,
            'allArticles' => $allArticles
        ]);
    }

    /**
     * @Route("/blog/article/{slug}", name="article")
     */
    public function article($slug): Response
    {
        $article = $this->articleRepository->findOneBySlug($slug);
        
        return $this->render('blog/article.html.twig', [
            'article' => $article,
        ]);
    }

     /**
     * @Route("/blog/articles/category/{slug}", name="article_category")
     */
    public function article_category($slug, Request $request): Response
    {
        $articlesCategorie = $this->articleCategoryRepository->findOneBySlug($slug);
        $articles = $this->articleRepository->findByCategory($articlesCategorie, ['id' => 'DESC']);

        $pagination = $this->paginator->paginate(
            $articles,
            $request->query->getInt('page', 1),
            12
        );

        return $this->render('blog/article-category.html.twig', [
            'articlesCategorie' => $articlesCategorie,
            'articles' => $pagination,
        ]);
    }

    /**
     * @Route("/blog/articles", name="articles")
     */
    public function articles(Request $request): Response
    {
        $query = $this->articleRepository->findBy(array('isActive' => true), array('id' =>'DESC'));
        $articles = $this->paginator->paginate(
            $query,
            $request->query->get('page', 1),
            12
        );

        return $this->render('blog/articles.html.twig', [
            'articles' => $articles,
        ]);
    }
}
