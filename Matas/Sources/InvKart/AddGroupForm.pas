{               "Учет товарно-материальных ценностей, ОС, МНА и МБП"           }
{                              Инвентарная картотека                           }
{                                                                              }
{               (c) Шамарин Ю.В., Данильченко А.Н.     2004-2007               }
{                                                                              }
unit AddGroupForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCalendar, cxLabel, ExtCtrls,
  cxLookAndFeelPainters, StdCtrls, cxButtons, ImgList, ClassInvKart,
  ActnList, DB, MainInvKartForm, uResources;

type
  TfmInvAddPapka = class(TForm)
    cxLabel2: TcxLabel;
    cxTextEditName: TcxTextEdit;
    Bevel1: TBevel;
    cxButtonAdd: TcxButton;
    cxButtonClose: TcxButton;
    Label1: TLabel;
    cxTextEditKod: TcxTextEdit;
    ActionList1: TActionList;
    Action1: TAction;
    procedure cxButtonCloseClick(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
  private
    FlagNaAdd : boolean;
    myform : TfmMainIvKartForm;
    na_chaild : int64;
  public
    constructor Create(mform: TfmMainIvKartForm; Flag : boolean); reintroduce; overload;
  end;


implementation

{$R *.dfm}


constructor TfmInvAddPapka.Create(mform: TfmMainIvKartForm; Flag: boolean);
begin
    inherited Create(nil);
    myform := mform;
    FlagNaAdd := flag;

    cxLabel2.Caption      := MAT_INV_Add_Papka_Name_papki;
    cxButtonClose.Caption := MAT_INV_Cansel;
    Label1.Caption        := MAT_INV_Add_Papka_Group_kod;
    If FlagNaAdd = true then
    begin
        Caption := MAT_INV_system_name + MAT_INV_Add_Papka_Caption_na_Add;
        cxButtonAdd.Caption := MAT_INV_Add;

    end else
    begin
        Caption := MAT_INV_system_name + MAT_INV_Add_Papka_Caption_na_change;
        cxTextEditName.Text := myform.DataSetPapka.FieldByName('NAME_GRP').AsString;
        cxTextEditKod.Text := myform.DataSetPapka.FieldByName('KOD_GRP').AsString;
        cxButtonAdd.Caption := MAT_INV_Change;
     end;
end;

procedure TfmInvAddPapka.cxButtonCloseClick(Sender: TObject);
begin
    close;
end;

procedure TfmInvAddPapka.Action1Execute(Sender: TObject);
var
    j : int64;
begin
    if FlagNaAdd = true then
    begin
          if (cxTextEditName.Text = '') or (cxTextEditKod.Text = '') then
           begin
            ShowMessage(MAT_INV_Add_Papka_zap_all_pola);
            exit;
           end
           else
            begin
            if (myform.DataSetPapka.FieldByName('LINK_TO').AsVariant = -1) then
             begin
                 na_chaild := 0;
             end else
             begin
                 na_chaild := 2;
             end;
             j := AddPapka(cxTextEditName.Text, cxTextEditKod.Text, myform.DataSetPapka.FieldByName('ID_INV_GRP').AsInteger, 0);
             ChangeChild(myform.DataSetPapka.FieldByName('ID_INV_GRP').AsVariant, na_chaild);
              If j > 0 then
              begin
                   myform.Special_actionExecute(Sender);
                   myform.DataSetPapka.Locate('ID_INV_GRP', j, []);
                   close;
              end;
           end;
    end;
    if FlagNaAdd = false then
    begin
        if cxTextEditName.Text = '' then
        begin
            ShowMessage('');
            exit;
        end
        else
        begin
            j := myform.DataSetPapka.FieldByName('ID_INV_GRP').AsVariant;
            ChangePapka(myform.DataSetPapka.FieldByName('ID_INV_GRP').AsVariant, cxTextEditName.Text, cxTextEditKod.Text, myform.DataSetPapka.FieldByName('LINK_TO').AsVariant);
            myform.Special_actionExecute(Sender);
            myform.DataSetPapka.Locate('ID_INV_GRP', j, []);
            close;
        end;
    end;
end;

end.
