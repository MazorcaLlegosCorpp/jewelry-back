import { Controller, Post, UseGuards, Body } from '@nestjs/common';
import { AuthService } from './auth.service';
import { LocalAuthGuard } from './local-auth.guard';
import { RegisterAuthDto } from './dto/RegisterAuthDto';
import { LoginAuthDto } from './dto/login-auth.dto';

@Controller('auth')
export class AuthController {
  constructor(private authService: AuthService) {}

  @UseGuards(LocalAuthGuard)
  @Post('login')
  async login(@Body() userObject: LoginAuthDto) {
    return this.authService.login(userObject);
  }

  @Post('register')
  register(@Body() userObject: RegisterAuthDto) {
    return this.authService.register(userObject);
  }
}
