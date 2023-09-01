import { Module } from '@nestjs/common';

import { UsersController } from '../../controllers/users.controller';
import { UsersService } from 'services/users.service';
import { UsersRepository } from 'repositories/users.repository';

import { DataSourceProvider } from 'configs/dataSource.config';

@Module({
    controllers: [UsersController],
    providers: [UsersService, UsersRepository, DataSourceProvider],
})
export class UsersModule {}