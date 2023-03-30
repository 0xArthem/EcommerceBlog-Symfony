<?php

namespace App\Controller\Admin;

use App\Entity\Carrier;
use DateTime;
use EasyCorp\Bundle\EasyAdminBundle\Field\IdField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextEditorField;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractCrudController;
use EasyCorp\Bundle\EasyAdminBundle\Field\DateTimeField;
use EasyCorp\Bundle\EasyAdminBundle\Field\MoneyField;

class CarrierCrudController extends AbstractCrudController
{
    public static function getEntityFqcn(): string
    {
        return Carrier::class;
    }

    public function configureFields(string $pageName): iterable
    {
        return [
            IdField::new('id')->hideOnForm()->hideOnIndex(),
            TextField::new('name')->setLabel('Nom'),
            TextField::new('description')->setLabel('Description'),
            MoneyField::new('price')->setCurrency('EUR')->setLabel('Prix'),
            DateTimeField::new('createdAt')->hideOnForm()->setLabel('Date de création'),
            DateTimeField::new('updatedAt')->hideOnForm()->setLabel('Date de la dernière modification'),
        ];
    }
}
