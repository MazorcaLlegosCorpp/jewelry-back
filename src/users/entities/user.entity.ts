import {
  Entity,
  Column,
  PrimaryGeneratedColumn,
  ManyToOne,
  JoinColumn,
  BeforeInsert,
  BeforeUpdate,
} from 'typeorm';
import * as bcrypt from 'bcryptjs';
import { Role } from 'src/roles/entities/role.entity';

@Entity('users')
export class User {
  @PrimaryGeneratedColumn('uuid')
  id: string;

  @Column({ length: 255 })
  name: string;

  @Column({ length: 255, nullable: true })
  image: string;

  @Column('uuid', { nullable: true })
  role_id: string;

  @ManyToOne(() => Role, (role) => role.users)
  @JoinColumn({ name: 'roleId' })
  role: Role;

  @Column({ length: 255, nullable: true })
  office_leader: string;

  @Column({ length: 255, nullable: true })
  invitation_user: string;

  @Column('date', { nullable: true })
  date_of_admission: Date;

  @Column({ length: 255, nullable: true })
  city: string;

  @Column({ length: 255, nullable: true })
  phone_number: string;

  @Column({ length: 255, nullable: true })
  email: string;

  @Column({ length: 255, nullable: true })
  instagram: string;

  @Column({ length: 255, nullable: true })
  facebook: string;

  @Column({ length: 255, nullable: true })
  web: string;

  @Column({ length: 255, nullable: false })
  clave: string;

  @BeforeInsert()
  @BeforeUpdate()
  async hashPassword() {
    if (this.clave) {
      this.clave = await bcrypt.hash(this.clave, 10);
    }
  }
}
