unit EditNameDoc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DataModule, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxLookAndFeelPainters, StdCtrls, cxButtons, ExtCtrls, cxDropDownEdit,
  cxCalendar, cxMaskEdit, cxButtonEdit;

type
  TEditNameDocForm = class(TForm)
    Name_Doc: TcxTextEdit;
    Label1: TLabel;
    Cost_Unit_Meas: TcxButtonEdit;
    Label5: TLabel;
    DateTimePicker1: TcxDateEdit;
    Label3: TLabel;
    Bevel1: TBevel;
    OkButton: TcxButton;
    CancelButton: TcxButton;
    procedure OkButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Cost_Unit_MeasPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private
    { Private declarations }
  public
   destructor Destroy; override;
  end;

var
  EditNameDocForm: TEditNameDocForm;

  id_unit_meas : integer;
  Coefficient  : integer;

implementation

{$R *.dfm}

uses tagBaseTypes, tagSys_Options, fpop_PackageLoader;

destructor TEditNameDocForm.Destroy;
begin
  EditNameDocForm := nil;
  inherited;
end;

procedure TEditNameDocForm.OkButtonClick(Sender: TObject);
begin
 if Name_Doc.Text = '' then begin
  ShowMessage('Ви не ввели назву документу');
  Exit;
 end;

 if Cost_Unit_Meas.Text = '' then begin
  ShowMessage('Ви не обрали одиницю виміру вартості продукції!');
  Exit;
 end;

 ModalResult := mrOk;
end;

procedure TEditNameDocForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 Action := caFree;
end;

procedure TEditNameDocForm.Cost_Unit_MeasPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
 i, o  : TSpravParams;
begin
 i := TSpravParams.Create;
 o := TSpravParams.Create;
 i.Values['DataBase'] := Integer(dm.Database.Handle);
 i.Values['ReadTransaction'] := Integer(dm.ReadTransaction.Handle);
 i.Values['WriteTransaction'] := Integer(dm.WriteTransaction.Handle);
 i.Values['FormStyle'] := fsNormal;
 LoadSprav('FPOP\ini_unit_meas.bpl', Self, i, o);
 if o['ModalResult'] = mrOk then begin
  id_unit_meas        := o.Values['ID_UNIT_MEAS'];
  Cost_Unit_Meas.Text := o.Values['NAME_UNIT_MEAS'];
  Coefficient         := o.Values['KOEF'];
 end;
end;

end.
