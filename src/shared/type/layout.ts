export interface IBaseLayout {
  children: React.ReactNode;
}

export interface ILayout extends Readonly<IBaseLayout> {}
