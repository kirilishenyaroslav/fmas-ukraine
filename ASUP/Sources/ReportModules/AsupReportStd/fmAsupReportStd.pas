unit fmAsupReportStd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, cxLabel, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxButtonEdit, cxLookAndFeelPainters, StdCtrls, cxButtons,
  cxDropDownEdit, cxCalendar, ActnList, IBase, uCommonSp,
  Asup_LoaderPrintDocs_Types, Asup_LoaderPrintDocs_Proc,
  Asup_LoaderPrintDocs_WaitForm, ASUP_LoaderPrintDocs_Consts,
  ASUP_LoaderPrintDocs_Messages, cxMRUEdit, cxCheckBox, DB, FIBDatabase,
  pFIBDatabase, FIBDataSet, pFIBDataSet, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, cxSpinEdit;

type
  TFormOptions = class(TForm)
    YesBtn: TcxButton;
    CancelBtn: TcxButton;
    ActionList: TActionList;
    YesAction: TAction;
    CancelAction: TAction;
    DesRep: TAction;
    EditDepartment: TcxButtonEdit;
    LabelDepartment: TcxLabel;
    CheckBoxWithChild: TcxCheckBox;
    DB: TpFIBDatabase;
    DSet: TpFIBDataSet;
    Tran: TpFIBTransaction;
    LabelDateForm: TcxLabel;
    DateEdit: TcxDateEdit;
    Bevel1: TBevel;
    LabelDateWork: TcxLabel;
    WorkEdit: TcxDateEdit;
    LabelDateStd: TcxLabel;
    StdEdit: TcxDateEdit;
    procedure CancelActionExecute(Sender: TObject);
    procedure YesActionExecute(Sender: TObject);
    procedure DesRepExecute(Sender: TObject);
    procedure cxMRUEdit1PropertiesButtonClick(Sender: TObject);
    procedure EditDepartmentPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private
    PDb_Handle:TISC_DB_HANDLE;
    PId_Depratment:integer;
    PDesignRep: Boolean;
  public
    constructor Create(AParameter:TSimpleParam);reintroduce;
    property Id_Department:integer read PId_Depratment;
    property DesignRep:Boolean read PDesignRep write PDesignRep;    
  end;


implementation

{$R *.dfm}

constructor TFormOptions.Create(AParameter:TSimpleParam);
var Year, Month, Day: Word; str:string;
begin
    inherited Create(AParameter.Owner);
    PDb_Handle:=AParameter.DB_Handle;
    Caption := 'Періоди вибрання';
    YesBtn.Caption := YesBtn_Caption;
    CancelBtn.Caption := CancelBtn_Caption;
    YesBtn.Hint := YesBtn.Caption;
    CancelBtn.Hint := CancelBtn.Caption;
    LabelDepartment.Caption := Label_Department_Caption;
    CheckBoxWithChild.Properties.Caption := CheckBoxWithChild_Caption;
    LabelDateForm.Caption := Label_DateSelect_Caption;
    LabelDateWork.Caption := 'Працює до';
    LabelDateStd.Caption := 'Є вибрання на';
    DateEdit.Date := Date;
    DecodeDate(Date,Year, Month, Day);
    str:='31.08.'+inttostr(year);
    WorkEdit.Date:=strtodate(str);
    str:='';
    str:='01.09.'+inttostr(year);
    StdEdit.Date:=strtodate(str);
    PId_Depratment:=-255;
    PDesignRep:=false;
    DSet.SQLs.SelectSQL.Text := 'SELECT CURRENT_DEPARTMENT, FIRM_NAME FROM INI_ASUP_CONSTS';
    DB.Handle:=AParameter.DB_Handle;
    DSet.Open;
    EditDepartment.Text:= DSet.FieldValues['FIRM_NAME'];
    PId_Depratment:=DSet.FieldValues['CURRENT_DEPARTMENT'];

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
   {if DateEditBeg.Date>DateEditEnd.Date then
    begin
        AsupShowMessage(Error_Caption,E_Terms_Text,mtWarning,[mbOK]);
        Exit;
    end;   }
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
       ShowMessage('Не обрано жодного підрозділу!')
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
       ShowMessage('Не обрано жодного підрозділу!')
    else
    if not sp.Output.IsEmpty then
       begin
           EditDepartment.Text := varToStr(sp.Output['NAME_FULL']);
           PId_Depratment:=sp.Output['ID_DEPARTMENT'];
       end;
    sp.Free;
end;

procedure TFormOptions.DesRepExecute(Sender: TObject);
begin
    PDesignRep:=not PDesignRep;
end;


end.
