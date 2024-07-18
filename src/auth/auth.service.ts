import { HttpException, Injectable } from '@nestjs/common';
import { JwtService } from '@nestjs/jwt';
import { UsersService } from '../users/users.service';
import * as bcrypt from 'bcryptjs';
import { RegisterAuthDto } from './dto/RegisterAuthDto';
import { hash, compare } from 'bcryptjs';
import { LoginAuthDto } from './dto/login-auth.dto';

@Injectable()
export class AuthService {
  constructor(
    private usersService: UsersService,
    private jwtService: JwtService,
  ) {}

  async validateUser(email: string, pass: string): Promise<any> {
    const user = await this.usersService.findByEmail(email);
    if (user && (await bcrypt.compare(pass, user.password))) {
      const { password, ...result } = user;
      return result;
    }
    return null;
  }

  async login(user: LoginAuthDto) {
    const { email, password } = user;
    const findUser = await this.usersService.findByEmail(email);
    if (!findUser) new HttpException('USER_NOT_FOUND', 404);

    const checkPassword = await compare(password, findUser.password);

    if (!checkPassword) new HttpException('INVALID_PASSWORD', 403);

    const data = findUser;
    return data;
  }

  async register(userObject: RegisterAuthDto) {
    const { password } = userObject;
    const plainToHash = await hash(password, 10);
    userObject = { ...userObject, password: plainToHash };
    return this.usersService.create(userObject);
  }
}
