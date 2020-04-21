<?php

use Phinx\Db\Adapter\PostgresAdapter;
use Phinx\Migration\AbstractMigration;

class CreateAppSchema extends AbstractMigration
{
    public function change()
    {
        $this->table('cookies')
            ->addColumn('type', PostgresAdapter::PHINX_TYPE_TEXT, ['null' => false])
            ->addColumn('delicious', PostgresAdapter::PHINX_TYPE_BOOLEAN, ['null' => false, 'default' => true])
            ->create();
    }
}
