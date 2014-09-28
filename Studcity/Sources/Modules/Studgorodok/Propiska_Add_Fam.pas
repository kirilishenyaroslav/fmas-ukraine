unit Propiska_Add_Fam;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
  cxButtonEdit, cxLookAndFeelPainters, StdCtrls, cxButtons, cxGroupBox,
  cxDropDownEdit;

type
  Tfrm_FIO_Add = class(TForm)
    prp_fs_GroupBox2: TcxGroupBox;
    FIO_Label: TLabel;
    Type_Label: TLabel;
    Fio_Edit: TcxButtonEdit;
    Svyaz_Combo: TcxComboBox;
    OkButton: TcxButton;
    CancelButton: TcxButton;
    procedure Fio_EditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure OkButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    id_kod_of_relation: int64;
  end;

var
  frm_FIO_Add: Tfrm_FIO_Add;

implementation

uses Propiska_Add_Fam_Relations;

{$R *.dfm}

procedure Tfrm_FIO_Add.Fio_EditPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
frm_FIO_Family:=Tfrm_FIO_Family.create(self);
frm_FIO_Family.DataSet.Open;
if frm_FIO_Family.ShowModal = mrOk then
begin
id_kod_of_relation := frm_FIO_Family.DataSet['id_kod'];
Fio_Edit.Text:= frm_FIO_Family.DataSet['FIO_COMBO'];
frm_FIO_Family.DataSet.Close;
frm_FIO_Family.Free;
end;
end;

procedure Tfrm_FIO_Add.OkButtonClick(Sender: TObject);
begin
if Fio_Edit.Text ='' then begin
ShowMessage('¬‚Â‰ËÚÂ ‘»Œ');
Fio_Edit.SetFocus;
exit;
end;
ModalResult:=mrOk;
end;

procedure Tfrm_FIO_Add.CancelButtonClick(Sender: TObject);
begin
close;
end;

end.
