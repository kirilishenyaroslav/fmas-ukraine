{               "Учет товарно-материальных ценностей, ОС, МНА и МБП"           }
{                              Номенклатор                                     }
{                                                                              }
{               (c) Шамарин Ю.В. 2004-2007                                     }
{                                                                              }
unit uSpNomSearchForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxControls, cxContainer, cxEdit,
  cxTextEdit, StdCtrls, cxButtons, ExtCtrls, cxCheckBox, uSpNomLang;

type
  TSpNomSearchForm = class(TForm)
    LabelFind: TLabel;
    cxSearchEdit: TcxTextEdit;
    OkButton: TcxButton;
    CancelButton: TcxButton;
    cxUpperStr: TcxCheckBox;
    cxAdvSearch: TcxCheckBox;
    procedure cxSearchEditKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure OkButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SpNomSearchForm: TSpNomSearchForm;

implementation

{$R *.dfm}

procedure TSpNomSearchForm.cxSearchEditKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 if Key=VK_RETURN  then
  OkButton.Click;
end;

procedure TSpNomSearchForm.FormCreate(Sender: TObject);
begin
 LabelFind.Caption:=NOM_STR_MSG_FIND_STRING;
 cxUpperStr.Properties.Caption:=NOM_STR_UPPER_STR;
 cxAdvSearch.Properties.Caption:=NOM_STR_ADV_SEARCH;
 OkButton.Caption:=NOM_STR_ACTION_FIND_CONST;
 CancelButton.Caption:=NOM_STR_BUTTON_CANCEL_CONST;
end;

procedure TSpNomSearchForm.OkButtonClick(Sender: TObject);
begin
 if cxAdvSearch.Checked then
  cxSearchEdit.Text:='%'+cxSearchEdit.Text;
 if cxUpperStr.Checked then
  cxSearchEdit.Text:=AnsiUpperCase(cxSearchEdit.Text);
end;

end.
