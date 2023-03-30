<?php

namespace App\Controller\Admin;

use App\Entity\Address;
use App\Entity\Carrier;
use App\Entity\Categories;
use App\Entity\Product;
use App\Entity\RelatedProduct;
use App\Entity\ReviewsProduct;
use App\Entity\TagsProduct;
use App\Entity\User;
use EasyCorp\Bundle\EasyAdminBundle\Config\Dashboard;
use EasyCorp\Bundle\EasyAdminBundle\Config\MenuItem;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractDashboardController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class DashboardController extends AbstractDashboardController
{
    /**
     * @Route("/admin", name="admin")
     */
    public function index(): Response
    {
        return parent::index();
    }

    public function configureDashboard(): Dashboard
    {
        return Dashboard::new()
            ->setTitle('Ecommerce Starter');
    }

    public function configureMenuItems(): iterable
    {
        yield MenuItem::linkToDashboard('Dashboard', 'fa fa-home');
        yield MenuItem::linkToCrud('Adresse', 'fas fa-list', Address::class);
        yield MenuItem::linkToCrud('Categories', 'fas fa-list', Categories::class);
        yield MenuItem::linkToCrud('Produit', 'fas fa-list', Product::class);
        yield MenuItem::linkToCrud('RelatedProduct', 'fas fa-list', RelatedProduct::class);
        yield MenuItem::linkToCrud('Avis', 'fas fa-list', ReviewsProduct::class);
        yield MenuItem::linkToCrud('Tag', 'fas fa-list', TagsProduct::class);
        yield MenuItem::linkToCrud('Utilisateur', 'fas fa-list', User::class);
        yield MenuItem::linkToCrud('Transporteur', 'fas fa-list', Carrier::class);
    }
}
