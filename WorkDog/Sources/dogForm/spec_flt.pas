unit spec_flt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLabel, cxCheckBox, cxControls, cxContainer, cxEdit,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, cxButtonEdit,
  cxGroupBox, cxLookAndFeelPainters, StdCtrls, cxButtons,AArray,
  FIBDatabase, pFIBDatabase;

type
  TfltSpecForm = class(TForm)
    cxGroupBox1: TcxGroupBox;
    fltDateEndEdit: TcxDateEdit;
    fltDateBegEdit: TcxDateEdit;
    fltDatePeriodCheck: TcxCheckBox;
    cxLabel10: TcxLabel;
    cxGroupBox2: TcxGroupBox;
    cxCheckBox1: TcxCheckBox;
    cxClassEdit: TcxButtonEdit;
    cbClass: TcxCheckBox;
    OKButton: TcxButton;
    cxButton2: TcxButton;
    cxButton3: TcxButton;
    pFIBDatabase1: TpFIBDatabase;
    procedure fltDatePeriodCheckClick(Sender: TObject);
    procedure cbClassClick(Sender: TObject);
    procedure cxClassEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  id_class : Integer;
  fltSpecForm: TfltSpecForm;

implementation

{$R *.dfm}

procedure TfltSpecForm.fltDatePeriodCheckClick(Sender: TObject);
begin
 fltDateBegEdit.Enabled := fltDatePeriodCheck.Checked;
 fltDateEndEdit.Enabled := fltDatePeriodCheck.Checked;

 if fltDateBegEdit.Enabled and visible then fltDateBegEdit.SetFocus;
end;

procedure TfltSpecForm.cbClassClick(Sender: TObject);
begin
 cxClassEdit.Enabled := cbClass.Checked;

 if (cbClass.Checked) then
    cxClassEditPropertiesButtonClick(Self,0)
 else
 begin
  id_class:=0;
 end;
end;

procedure TfltSpecForm.cxClassEditPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
  i, o : TAArray;
begin
  i := TAArray.Create;
  o := TAArray.Create;
  i['Owner'].AsObject := Self;
  i['FormStyle'].AsVariant := fsNormal;
  i['Caption'].AsString := 'Класiфiкатор продукцiї';
  i['CaptionEdit'].AsString := 'клас';
  i['TableName'].AsString := 'pub_SP_CLASS';
  i['KEY_FIELD'].AsString := 'id_ist';
  i['parent_field'].AsString := 'linkto';
  i['FIELDS'].AsString := 'SHIFR;name_ist';
  i['FIELDS_caption'].AsString := 'Шифр;Назва;';
  i['SearchField'].AsString := 'FIND_FIELD';
  i['AddProc'].AsString := 'PUB_SP_CLASS_ADD';
  i['DelProc'].AsString := 'PUB_SP_CLASS_DEL';
  i['UpdProc'].AsString := 'PUB_SP_CLASS_MOD';
  i['DBHandle'].AsInteger := integer(pFIBDatabase1.handle);

//  LoaderUnit.LoadSprav(ExtractFilePath(Application.ExeName) + 'workdog\UnivTree.bpl', i, o);

  if o['MoadResult'].AsVariant = mrOk then
  begin
    id_class := o['ID_IST'].asInt64;
    cxClassEdit.Text := o['SHIFR'].AsString+'.'+o['NAME_IST'].AsString;
  end;
//  showmessage(IntToStr(id_class));
  i.Free;
  o.Free;
end;

end.
