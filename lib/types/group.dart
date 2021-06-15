/*
  @PrimaryGeneratedColumn()
  id: number;

  // @Column()
  // userId: string;

  @Column()
  name: string;

  @CreateDateColumn()
  createdAt: Date;

  @UpdateDateColumn()
  updatedAt: Date;

  @DeleteDateColumn()
  deletedAt: Date;

  @ManyToOne((_type) => User, (user) => user.groups, { eager: false })
  @Exclude({ toPlainOnly: true })
  user: User;
 */
class Group {
  final int id;
  final String name;
  final String createdAt;
  final String updatedAt;

  Group(this.id, this.name, this.createdAt, this.updatedAt);

  Group.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        createdAt = json['createdAt'],
        updatedAt = json['updatedAt'];
}
