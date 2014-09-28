unit fmAsupReportShtatRasp;

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
    LabelDateForm: TcxLabel;
    DateEdit: TcxDateEdit;
    DSet: TpFIBDataSet;
    cxTypePost: TcxCheckBox;
    ComboTypePost: TcxLookupComboBox;
    DSource: TDataSource;
    cxKodSm: TcxCheckBox;
    KodSmEdit: TcxButtonEdit;
    DSetTypePost: TpFIBDataSet;
    SR: TcxButtonEdit;
    LabelShtatDoc: TcxLabel;
    procedure CancelActionExecute(Sender: TObject);
    procedure YesActionExecute(Sender: TObject);
    procedure DesRepExecute(Sender: TObject);
   { procedure cxMRUEdit1PropertiesButtonClick(Sender: TObject);   }
    procedure EditDepartmentPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxTypePostClick(Sender: TObject);
    procedure KodSmEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxKodSmClick(Sender: TObject);
    procedure SRPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private
    PDb_Handle:TISC_DB_HANDLE;
    PId_Depratment:integer;
    PId_SR:integer;
    PKodSm:integer;
    PTypePost:integer;
    PDesignRep: Boolean;
    PNameTypePost:String;
  public
    constructor Create(AParameter:TSimpleParam);reintroduce;
    property Id_Department:integer read PId_Depratment;
    property Id_SR:integer read PId_SR;
    property KodSm:integer read PKodSm;
    property TypePost:integer read PTypePost;
    property NameTypePost:String read PNameTypePost;
    property DesignRep:Boolean read PDesignRep write PDesignRep;
  end;


implementation
uses GlobalSPR, dmAsupReportShtatRasp;
{$R *.dfm}
constructor TFormOptions.Create(AParameter:TSimpleParam);
begin
    inherited Create(AParameter.Owner);
    PDb_Handle:=DM.DB.Handle;
    Caption := 'Виконання штатного розкладу';
    YesBtn.Caption := YesBtn_Caption;
    CancelBtn.Caption := CancelBtn_Caption;
    YesBtn.Hint := YesBtn.Caption;
    CancelBtn.Hint := CancelBtn.Caption;
    LabelDepartment.Caption := Label_Department_Caption;
    CheckBoxWithChild.Properties.Caption := CheckBoxWithChild_Caption;
    LabelShtatDoc.Caption := 'Документ штатного розкладу';
    PId_SR:=-255;
    PId_Depratment:=-255;
    PKodSm:=-255;
    PTypePost:=-255;
    PDesignRep:=false;
    LabelDateForm.Caption := Label_DateSelect_Caption;
    DateEdit.Date := Date;
    DSet.SQLs.SelectSQL.Text := 'SELECT CURRENT_DEPARTMENT, FIRM_NAME FROM INI_ASUP_CONSTS';
    DSetTypePost.SQLs.SelectSQL.Text := 'SELECT ID_TYPE_POST, NAME_TYPE_POST FROM SP_TYPE_POST';
    DSet.Database:=DM.DB;
    DSet.Transaction:=DM.ReadTransaction;
    DSet.UpdateTransaction:=DM.ReadTransaction;
    DSetTypePost.Database:=DM.DB;
    DSetTypePost.Transaction:=DM.ReadTransaction;
    DSetTypePost.UpdateTransaction:=DM.ReadTransaction;

    DSet.Open;
    DSetTypePost.Open;
    EditDepartment.Text:= DSet.FieldValues['FIRM_NAME'];
    PId_Depratment:=DSet.FieldValues['CURRENT_DEPARTMENT'];
end;

procedure TFormOptions.CancelActionExecute(Sender: TObject);
begin
    ModalResult:=mrCancel;
end;

procedure TFormOptions.YesActionExecute(Sender: TObject);
begin
    if SR.Text='' then
    begin
        AsupShowMessage(Error_Caption,'Треба обрати документ штатного розкладу',mtWarning,[mbOK]);
        Exit;
    end;
    if EditDepartment.Text='' then
    begin
        AsupShowMessage(Error_Caption,E_NotSelectDepartment_Text,mtWarning,[mbOK]);
        Exit;
    end;
    if (varIsNUll(ComboTypePost.EditValue) and (cxTypePost.Checked)) then
    begin
        AsupShowMessage(Error_Caption,'Треба обрати тип персоналу!',mtWarning,[mbOK]);
        Exit;
    end;
    if (varIsNUll(KodSmEdit.EditValue) and (cxKodSm.Checked)) then
    begin
        AsupShowMessage(Error_Caption,'Треба обрати кошторис!',mtWarning,[mbOK]);
        Exit;
    end;

    if not varIsNUll(ComboTypePost.EditValue) then
    PTypePost:=ComboTypePost.EditValue;
    ModalResult := mrYes;
end;

procedure TFormOptions.SRPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
    sp: TSprav;
begin
        // создать справочник
    sp :=  GetSprav('ASUP\ShtatDoc');
    if sp <> nil then
    begin
            // заполнить входные параметры
        with sp.Input do
        begin
            Append;
            FieldValues['DBHandle'] := Integer(PDb_Handle);
                // модальный показ
            FieldValues['ShowStyle'] := 0;
                // единичная выборка
            FieldValues['Select'] := 1;
            Post;
        end;

                // показать справочник и проанализировать результат (выбор одного подр.)
        sp.Show;
        if ( sp.Output <> nil ) and not sp.Output.IsEmpty then
        begin
           SR.Text := varToStr(sp.Output['Name']);
           PId_SR:=sp.Output['Id_SR'];
        end;
        sp.Free;
    end;
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
            FieldValues['Actual_Date'] := DateEdit.Date;
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


procedure TFormOptions.cxTypePostClick(Sender: TObject);
begin
    ComboTypePost.Enabled:=cxTypePost.Checked;
end;

procedure TFormOptions.KodSmEditPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var Smeta:Variant;
begin
    Smeta:=GetSmets(self,PDb_Handle,Date,psmSmet);
    if VarArrayDimCount(Smeta)> 0 then
    If Smeta[0]<>NULL then
    begin
        KodSmEdit.Text := Smeta[2];
        PKodSm := Smeta[0];
        KodSmEdit.Text := Smeta[2];
    end;
end;

procedure TFormOptions.cxKodSmClick(Sender: TObject);
begin
    KodSmEdit.Enabled:=cxKodSm.Checked;
end;



end.
