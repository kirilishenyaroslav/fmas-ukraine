//******************************************************************************
//* Проект "Горводоканал"                                                      *
//* Форма Добавления/Редактирования коментариев к договорам                    *
//* Выполнил: Перчак А.Л. 2010г                                                *
//******************************************************************************
unit uReestr_Comments_AE;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxContainer, cxEdit, cxTextEdit, cxMemo,
  StdCtrls, cxControls, cxGroupBox, cxButtons, uConsts;

type
  Tfrm_comments_ae = class(TForm)
    OkButton: TcxButton;
    CancelButton: TcxButton;
    cxGroupBox1: TcxGroupBox;
    Comment_label: TLabel;
    Memo1: TcxMemo;
    procedure CancelButtonClick(Sender: TObject);
    procedure OkButtonClick(Sender: TObject);
    procedure FormIniLanguage;
  private
    { Private declarations }
  public
    PLanguageIndex : Byte;
    constructor Create(AOwner:TComponent; LanguageIndex : byte);reintroduce;
  end;

var
  frm_comments_ae: Tfrm_comments_ae;

implementation

{$R *.dfm}
constructor Tfrm_comments_ae.Create(AOwner:TComponent; LanguageIndex : byte);
begin
  Screen.Cursor:=crHourGlass;
  inherited Create(AOwner);
  PLanguageIndex:= LanguageIndex;
  FormIniLanguage();
  Screen.Cursor:=crDefault;
end;

procedure Tfrm_comments_ae.FormIniLanguage;
begin
  OkButton.Caption:=        uConsts.bs_Accept[PLanguageIndex];
  CancelButton.Caption:=    uConsts.bs_Cancel[PLanguageIndex];
end;

procedure Tfrm_comments_ae.CancelButtonClick(Sender: TObject);
begin
  ModalResult:=mrCancel;
end;

procedure Tfrm_comments_ae.OkButtonClick(Sender: TObject);
begin
  ModalResult:=mrOk;
end;

end.
