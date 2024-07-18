import { PartialType } from '@nestjs/mapped-types';
import { IsNotEmpty, IsEmail, MinLength, MaxLength } from 'class-validator';
import { LoginAuthDto } from './login-auth.dto';

export class RegisterAuthDto extends PartialType(LoginAuthDto) {
  @IsNotEmpty()
  name: string;

  @IsEmail()
  email: string;

  @MinLength(4)
  @MaxLength(16)
  password: string;
}
