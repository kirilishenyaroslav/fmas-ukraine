unit AcceptedReport_FilterForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, cxLabel, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxButtonEdit, cxLookAndFeelPainters, StdCtrls, cxButtons,
  cxDropDownEdit, cxCalendar, ActnList, IBase, uCommonSp,
  Asup_LoaderPrintDocs_Types, Asup_LoaderPrintDocs_Proc,
  Asup_LoaderPrintDocs_WaitForm, ASUP_LoaderPrintDocs_Consts,
  ASUP_LoaderPrintDocs_Messages, cxMRUEdit, cxCheckBox,qftools,DateUtils;

type
  TFormOptions = class(TForm)
    Bevel1: TBevel;
    LabelDateEnd: TcxLabel;
    DateEditEnd: TcxDateEdit;
    DateEditBeg: TcxDateEdit;
    LabelDateBeg: TcxLabel;
    ActionList: TActionList;
    YesAction: TAction;
    CancelAction: TAction;
    YesBtn: TcxButton;
    CancelBtn: TcxButton;
    CatComboBox: TcxComboBox;
    cxLabel1: TcxLabel;
    LabelDepartment: TcxLabel;
    EditDepartment: TcxButtonEdit;
    CheckBoxWithChild: TcxCheckBox;
    procedure CancelActionExecute(Sender: TObject);
    procedure YesActionExecute(Sender: TObject);
    procedure cxMRUEdit1PropertiesButtonClick(Sender: TObject);
    procedure EditDepartmentPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private
    PDb_Handle:TISC_DB_HANDLE;
    PId_Depratment:integer;
  public
    constructor Create(AParameter:TSimpleParam);reintroduce;
    property Id_Department:integer read PId_Depratment;
  end;


implementation

{$R *.dfm}
constructor TFormOptions.Create(AParameter:TSimpleParam);
var Year, Month, Day, Days: Word; str:string;
begin
 inherited Create(AParameter.Owner);
 PDb_Handle:=AParameter.DB_Handle;
//******************************************************************************
 Caption := 'Список працівників, прийнятих за період (форма №21)';
 YesBtn.Caption := 'Гаразд';
 CancelBtn.Caption := 'Відміна';
 YesBtn.Hint := 'Гаразд';
 CancelBtn.Hint := 'Відміна';
 LabelDepartment.Caption := Label_Department_Caption;
 CheckBoxWithChild.Properties.Caption := CheckBoxWithChild_Caption;
 PId_Depratment:=-255;
 LabelDateBeg.Caption := 'Введіть період з';
 LabelDateEnd.Caption := 'по';
//******************************************************************************
   DecodeDate(Date,Year, Month, Day);
   if month>9 then
   str:='01.'+inttostr(month)+'.'+inttostr(year)
   else
   str:='01.'+'0'+inttostr(month)+'.'+inttostr(year);
   DateEditBeg.Date:=strtodate(str);

   DecodeDate(Date,Year, Month, Day);
   Days:=DaysInAMonth(Year, Month);
   if month>9 then
   str:=inttostr(Days)+'.'+inttostr(Month)+'.'+inttostr(year)
   else
   str:=inttostr(Days)+'.'+'0'+inttostr(Month)+'.'+inttostr(year);
   DateEditEnd.Date:=strtodate(str);
   CatComboBox.Properties.Items.Add('Усі');
   CatComboBox.Properties.Items.Add('Науково-педагогічний персонал');
//******************************************************************************
end;

procedure TFormOptions.CancelActionExecute(Sender: TObject);
begin
ModalResult:=mrCancel;
end;

procedure TFormOptions.YesActionExecute(Sender: TObject);
begin
 if EditDepartment.Text='' then
    begin
        AsupShowMessage(Error_Caption,E_NotSelectDepartment_Text,mtWarning,[mbOK]);
        Exit;
    end;
 if DateEditBeg.Date>DateEditEnd.Date then
    begin
        AsupShowMessage(Error_Caption,E_Terms_Text,mtWarning,[mbOK]);
        Exit;
    end;
    ModalResult := mrYes;
end;

procedure TFormOptions.cxMRUEdit1PropertiesButtonClick(Sender: TObject);
var sp: TSprav;
begin
    sp := GetSprav('SpDepartment');
    if sp <> nil then
    begin
            // заполнить входные параметры
        with sp.Input do
        begin
            Append;
            FieldValues['DBHandle'] := Integer(PDb_Handle);
            FieldValues['ShowStyle'] := 0;
            FieldValues['Select'] := 1;
            FieldValues['Actual_Date'] := Date;
            Post;
        end;
    end;
    sp.Show;
    if sp.Output = nil then
        ShowMessage('BUG: Output is NIL!!!')
    else
    if not sp.Output.IsEmpty then
       begin
        EditDepartment.Text := varToStr(sp.Output['NAME_FULL']);
        PId_Depratment:=sp.Output['ID_DEPARTMENT'];
       end;
    sp.Free;
end;

procedure TFormOptions.EditDepartmentPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var sp: TSprav;
begin
    sp := GetSprav('SpDepartment');
    if sp <> nil then
    begin
            // заполнить входные параметры
        with sp.Input do
        begin
            Append;
            FieldValues['DBHandle'] := Integer(PDb_Handle);
            FieldValues['ShowStyle'] := 0;
            FieldValues['Select'] := 1;
            FieldValues['Actual_Date'] := Date;
            Post;
        end;
    end;
    sp.Show;
    if sp.Output = nil then
        ShowMessage('BUG: Output is NIL!!!')
    else
    if not sp.Output.IsEmpty then
       begin
        EditDepartment.Text := varToStr(sp.Output['NAME_FULL']);
        PId_Depratment:=sp.Output['ID_DEPARTMENT'];
       end;
    sp.Free;
end;

end.
