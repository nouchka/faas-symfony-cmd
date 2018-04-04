<?php
// src/Command/TestCommand.php
namespace App\Command;

use Symfony\Component\Console\Command\Command;
use Symfony\Component\Console\Input\InputInterface;
use Symfony\Component\Console\Output\OutputInterface;
use Symfony\Component\Console\Input\InputArgument;

class TestCommand extends Command
{
    protected function configure()
    {
	$this
	    ->setName('app:my-command')
            ->addArgument('input', InputArgument::REQUIRED, 'Type what you want.')
            ->setDescription('Testing faas with symfony.')
            ->setHelp('This command will output the input parameter');
    }

    protected function execute(InputInterface $input, OutputInterface $output)
    {
	$output->writeln(['Command result: '.$input->getArgument('input')]);
    }
}
