export class CreateUserDto {
  readonly name: string;
  readonly image?: string;
  readonly role_id?: string;
  readonly office_leader?: string;
  readonly invitation_user?: string;
  readonly date_of_admission?: Date;
  readonly city?: string;
  readonly phone_number?: string;
  readonly email: string;
  readonly instagram?: string;
  readonly facebook?: string;
  readonly web?: string;
  readonly clave: string;
}
