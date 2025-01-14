﻿unit UnitTelaDeInicio;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.WinXCtrls,
  Vcl.Imaging.pngimage, Vcl.Buttons, System.ImageList, Vcl.ImgList,
  Vcl.CategoryButtons, UnitTelaDeVendas;

type
  TfrmTelaDeInicio = class(TForm)
    sMenu: TSplitView;
    pnlLogo: TPanel;
    SpeedButton1: TSpeedButton;
    Panel1: TPanel;
    imgLogo: TImage;
    Panel2: TPanel;
    CategoryMenuButtons: TCategoryButtons;
    ImageList1: TImageList;
    sSubMenu: TSplitView;
    CategorySubMenuButtons: TCategoryButtons;
    Panel3: TPanel;
    lblTitleSubMenu: TPanel;
    procedure SpeedButton1Click(Sender: TObject);
    procedure CategoryMenuButtonsCategories0Items2Click(Sender: TObject);
    procedure CategoryMenuButtonsCategories0Items4Click(Sender: TObject);

    procedure sSubMenuEnter(Sender: TObject);
    procedure Panel3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure CategoryMenuButtonsCategories0Items5Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure CategoryMenuButtonsCategories0Items1Click(Sender: TObject);
  private
    procedure SubMenu01(menuIndex: Integer);
    procedure EsconderTodosSubMenus;
    procedure SubMenuItemClick(Sender: TObject);
  public
    { Public declarations }
  end;

var
  frmTelaDeInicio: TfrmTelaDeInicio;

implementation

{$R *.dfm}
{$REGION 'Section Create and Initialize'}

procedure TfrmTelaDeInicio.FormCreate(Sender: TObject);
begin
  KeyPreview := True;
end;

{$ENDREGION}

{$REGION 'Close Region'}

procedure TfrmTelaDeInicio.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);

begin
  if MessageDlg('Você realmente deseja fechar a aplicação?', mtConFirmation,
    [mbYes, mbNo], 0) = mrNo then
  begin
    CanClose := false;
    exit
  end
  else
  begin
    Application.Terminate;
    exit
  end;
end;
{$ENDREGION}

{$REGION 'Section KeyEvents'}

procedure TfrmTelaDeInicio.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
  begin
    if sSubMenu.Opened then
    begin
      sSubMenu.Opened := false;
      sMenu.SetFocus;
      CategoryMenuButtons.SelectedItem := nil;
    end
  end
end;
{$ENDREGION}


{$REGION 'Section Menu'}

procedure TfrmTelaDeInicio.CategoryMenuButtonsCategories0Items1Click(
  Sender: TObject);
begin
  lblTitleSubMenu.Caption := 'Saidas';
  SubMenu01(3);
end;

procedure TfrmTelaDeInicio.CategoryMenuButtonsCategories0Items2Click
  (Sender: TObject);
begin
  lblTitleSubMenu.Caption := 'Cadastros';
  SubMenu01(2);
end;

procedure TfrmTelaDeInicio.CategoryMenuButtonsCategories0Items4Click
  (Sender: TObject);
begin
  lblTitleSubMenu.Caption := 'Configurações';
  SubMenu01(1);
end;

procedure TfrmTelaDeInicio.CategoryMenuButtonsCategories0Items5Click
  (Sender: TObject);
begin
  Application.Terminate
end;

procedure TfrmTelaDeInicio.EsconderTodosSubMenus;
begin
  CategorySubMenuButtons.Categories.Clear;
end;

procedure TfrmTelaDeInicio.Panel3Click(Sender: TObject);
begin
  sSubMenu.Opened := false;
end;

procedure TfrmTelaDeInicio.SpeedButton1Click(Sender: TObject);
begin
  sSubMenu.Opened := false;
  CategoryMenuButtons.SelectedItem := nil;
  sMenu.Opened := not sMenu.Opened;
end;

procedure TfrmTelaDeInicio.sSubMenuEnter(Sender: TObject);
var
  itemCaption: string;
  subMenuItem: TCategoryButtons;

begin
  subMenuItem := TCategoryButtons(Sender);
  itemCaption := subMenuItem.SelectedItem.Caption;
  sSubMenu.Opened := false;
  SubMenuItemClick(Sender);
  sSubMenu.SetFocus;
end;

procedure TfrmTelaDeInicio.SubMenu01(menuIndex: Integer);
var
  subMenuCategory: TButtonCategory;
  subMenuItem: TButtonItem;
begin
  EsconderTodosSubMenus;
  sSubMenu.Opened := True;

  subMenuCategory := CategorySubMenuButtons.Categories.Add;
  subMenuCategory.VisibleGutter := false;

  case menuIndex of
    0:
      begin
        //
      end;
    1:
      begin
        subMenuItem := subMenuCategory.Items.Add;
        subMenuItem.Caption := 'Editar Perfil';
        subMenuItem.ImageIndex := 8;
        subMenuItem.OnClick := SubMenuItemClick;

        subMenuItem := subMenuCategory.Items.Add;
        subMenuItem.Caption := 'Alterar Senha Tamanho';
        subMenuItem.ImageIndex := 8;

        subMenuItem.OnClick := SubMenuItemClick;

        subMenuItem := subMenuCategory.Items.Add;
        subMenuItem.Caption := 'Tamanho da Fonte';
        subMenuItem.ImageIndex := 8;
        subMenuItem.OnClick := SubMenuItemClick;

      end;

    2:
      begin
        subMenuItem := subMenuCategory.Items.Add;
        subMenuItem.Caption := 'Clientes';
        subMenuItem.ImageIndex := 7;
        subMenuItem.OnClick := SubMenuItemClick;

        subMenuItem := subMenuCategory.Items.Add;
        subMenuItem.Caption := 'Produtos';
        subMenuItem.ImageIndex := 8;
        subMenuItem.OnClick := SubMenuItemClick;

      end;
    3:
      begin
        subMenuItem := subMenuCategory.Items.Add;
        subMenuItem.Caption := '  Iniciar Venda';
        subMenuItem.ImageIndex := 10;
        subMenuItem.OnClick := SubMenuItemClick;

      end;

  end;
end;

procedure TfrmTelaDeInicio.SubMenuItemClick(Sender: TObject);
var
  itemCaption: string;
  subMenuItem: TCategoryButtons;
begin
  if Sender is TCategoryButtons then
  begin
    subMenuItem := TCategoryButtons(Sender);
    itemCaption := subMenuItem.SelectedItem.Caption;
    sSubMenu.Opened := false;

    if itemCaption = 'Editar Perfil' then
    begin
      ShowMessage(itemCaption);
    end
    else if itemCaption = 'Alterar Senha Tamanho' then
    begin
      ShowMessage(itemCaption);
    end
    else if itemCaption = 'Tamanho da Fonte' then
    begin
      ShowMessage(itemCaption);
    end
    else if itemCaption = 'Clientes' then
    begin
      ShowMessage(itemCaption);
    end
    else if itemCaption = 'Produtos' then
    begin
      ShowMessage(itemCaption);
    end
    else if itemCaption = '  Iniciar Venda' then
    begin
        frmTelaDeVendas.Show;
    end;
  end
  else if Sender is TCategoryButtons then
  begin
    ShowMessage
      ('Sender é um TCategoryButtons. Certifique-se de que você está clicando em um TButtonItem dentro do TCategoryButtons.');
  end
  else
  begin
    ShowMessage('Sender não é TButtonItem. Tipo: ' + Sender.ClassName);
  end;
end;

{$ENDREGION}

end.
