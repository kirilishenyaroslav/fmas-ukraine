unit fmForma18;

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
  cxDBLookupComboBox, cxSpinEdit, uFControl, uLabeledFControl,
  uSpravControl;

type
  TFormOptions = class(TForm)
    Bevel1: TBevel;
    YesBtn: TcxButton;
    CancelBtn: TcxButton;
    ActionList: TActionList;
    YesAction: TAction;
    CancelAction: TAction;
    DesRep: TAction;
    EditDepartment: TcxButtonEdit;
    LabelDepartment: TcxLabel;
    CheckBoxWithChild: TcxCheckBox;
    DSet: TpFIBDataSet;
    Bevel2: TBevel;
    LabelDateBeg: TcxLabel;
    DateEditBeg: TcxDateEdit;
    LabelDateEnd: TcxLabel;
    DateEditEnd: TcxDateEdit;
    FontBtn: TcxButton;
    FontDialogs: TFontDialog;
    FontAction: TAction;
    procedure CancelActionExecute(Sender: TObject);
    procedure YesActionExecute(Sender: TObject);
    procedure DesRepExecute(Sender: TObject);
    procedure EditDepartmentPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure FontActionExecute(Sender: TObject);
  private
    PDb_Handle:TISC_DB_HANDLE;
    PId_Depratment:integer;
    PFontNames:string;
    PFontSizes:integer;
    PFontColors:TColor;
    PFontStyles:TFontStyles;
    PDesignRep: Boolean;
  public
    constructor Create(AParameter:TSimpleParam);reintroduce;
    property Id_Department:integer read PId_Depratment;
    property FontNames:string read PFontNames;
    property FontSizes:integer read PFontSizes;
    property FontColors:TColor read PFontColors;
    property FontStyles:TFontStyles read PFontStyles;
    property DesignRep:Boolean read PDesignRep write PDesignRep;
  end;


implementation
uses dmForma18;
{$R *.dfm}
constructor TFormOptions.Create(AParameter:TSimpleParam);
var Year, Month, Day: Word; str:string;
begin
    inherited Create(AParameter.Owner);
    PDb_Handle:=DM.DB.Handle;
    Caption := 'Інформація про закінчення труд. дог. зав. кафедрами (форма №18)';
    YesBtn.Caption := YesBtn_Caption;
    CancelBtn.Caption := CancelBtn_Caption;
    FontBtn.Caption := FontBtn_Caption;
    YesBtn.Hint := YesBtn.Caption;
    CancelBtn.Hint := CancelBtn.Caption;
    FontBtn.Hint := FontBtn.Caption;
    LabelDepartment.Caption := Label_Department_Caption;
    CheckBoxWithChild.Properties.Caption := CheckBoxWithChild_Caption;
    PId_Depratment:=-255;
    PFontNames:='Times New Roman';
    PFontSizes:=-255;
    PFontColors:=clDefault;
    PDesignRep:=false;
    LabelDateBeg.Caption := Label_DateBeg_Caption;
    LabelDateEnd.Caption := Label_DateEnd_Caption;
    //*******************************************
    DecodeDate(Date,Year, Month, Day);
    if (Month<9) then Year:=Year-1;
    str:='01.09.'+inttostr(year);
    DateEditBeg.Date:=strtodate(str);

    DecodeDate(Date,Year, Month, Day);
    if (Month>=9) then Year:=Year+1;
    str:='30.06.'+inttostr(year);
    DateEditEnd.Date:=strtodate(str);
    //*******************************************
    DSet.SQLs.SelectSQL.Text := 'SELECT CURRENT_DEPARTMENT, FIRM_NAME FROM INI_ASUP_CONSTS';
    DSet.Database:=DM.DB;
    DSet.Transaction:=DM.ReadTransaction;
    DSet.UpdateTransaction:=DM.ReadTransaction;
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
    ModalResult := mrYes;
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
            FieldValues['Actual_Date'] := DateEditEnd.Date;
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

procedure TFormOptions.FontActionExecute(Sender: TObject);
begin
    if FontDialogs.Execute
    then
    begin
        PFontNames := FontDialogs.Font.Name;
        PFontSizes := FontDialogs.Font.Size;
        PFontColors := FontDialogs.Font.Color;
        PFontStyles := FontDialogs.Font.Style;
    end;
end;

end.
