unit uPiPrepareAddRecordDoc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxGraphics, FIBQuery, pFIBQuery,
  pFIBStoredProc, FIBDatabase, pFIBDatabase, ActnList, dxStatusBar,
  cxCheckBox, StdCtrls, cxButtons, cxDropDownEdit, cxCalendar,
  cxButtonEdit, cxLabel, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, ExtCtrls, ibase, PackageLoad, ZTypes,  upi_resources, upi_Loader,
  ZProc, Unit_ZGlobal_Consts, zMessages, cxCurrencyEdit;

type
  TfmAddRecordDoc = class(TForm)
    Bevel1: TBevel;
    Bevel2: TBevel;
    PanelMan: TPanel;
    LabelFIO: TcxLabel;
    LabelTin: TcxLabel;
    PanelData: TPanel;
    DateEditCame: TcxDateEdit;
    DateEditLeave: TcxDateEdit;
    LabelSumNar: TcxLabel;
    LabelSumVipl: TcxLabel;
    LabelSumUd: TcxLabel;
    LabelSumPerer: TcxLabel;
    LabelDateCame: TcxLabel;
    LabelDateLeave: TcxLabel;
    LabelKod1DF: TcxLabel;
    LabelPriv: TcxLabel;
    ButtonEditPriv: TcxButtonEdit;
    YesBtn: TcxButton;
    CancelBtn: TcxButton;
    ButtonEditProp: TcxButtonEdit;
    MaskEditSumNar: TcxCurrencyEdit;
    MaskEditSumDoh: TcxCurrencyEdit;
    MaskEditSumTaxN: TcxCurrencyEdit;
    MaskEditSumTaxD: TcxCurrencyEdit;
    TextEditTn: TcxTextEdit;
    ButtonEditFIO: TcxButtonEdit;
    procedure YesBtnClick(Sender: TObject);
    procedure CancelBtnClick(Sender: TObject);
    procedure ButtonEditPropPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure ButtonEditPrivPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure MaskEditSumNarKeyPress(Sender: TObject; var Key: Char);
    procedure ButtonEditFIOPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure ButtonEditFIOKeyPress(Sender: TObject; var Key: Char);
    procedure TextEditTnKeyPress(Sender: TObject; var Key: Char);
    procedure TextEditTnExit(Sender: TObject);
    procedure MaskEditSumNarExit(Sender: TObject);
    procedure ButtonEditPropExit(Sender: TObject);
    procedure MaskEditSumDohEditing(Sender: TObject; var CanEdit: Boolean);
    procedure MaskEditSumTaxDExit(Sender: TObject);
    procedure MaskEditSumTaxNExit(Sender: TObject);
  private
    pass_data : string;
    flag_doh, flag_tax : integer;
    procedure GetPassportData(id_man: int64);
    procedure GetFioByInn(inn : string);
  public
    id_doc, id_prop_pilg, id_man,id_prop_income : variant;
    DB_handle : TISC_DB_HANDLE;
    constructor Create(AOwner:TComponent);reintroduce;
  end;

var
  fmAddRecordDoc: TfmAddRecordDoc;

implementation

uses DMPIPrepareDoc1df;

{$R *.dfm}


constructor TfmAddRecordDoc.Create(AOwner:TComponent);
begin
  Screen.Cursor:=crHourGlass;

  inherited Create(AOwner);
  flag_doh :=0;
  flag_tax :=0;

  Screen.Cursor:=crDefault;
end;

procedure  TfmAddRecordDoc.GetPassportData(id_man: int64);
var
    pass_num, pass_seria : string;
begin
    DM.DataSetPass.Close;
    DM.DataSetPass.SQLs.SelectSQL.Text := 'SELECT * FROM PASS_DATA_GET_BY_ID_MAN(:id_man,:is_cur)';
    DM.DataSetPass.ParambyName('id_man').Asint64  := id_man;
    DM.DataSetPass.ParambyName('is_cur').asString := 'T';
    DM.DataSetPass.Open;
    if(DM.DataSetPass['seria']=null) then
        pass_seria := ''
    else
        pass_seria := DM.DataSetPass['seria'];

    if(DM.DataSetPass['number']=null) then
        pass_num := ''
    else
        pass_num := DM.DataSetPass['number'];

    pass_data := pass_seria+pass_num;
end;

procedure  TfmAddRecordDoc.GetFioByInn(inn: string);
begin
    DM.DataSetInn.Close;
    DM.DataSetInn.SQLs.SelectSQL.Text := 'select * from PEOPLE p where p.tin =:inn';
    DM.DataSetInn.Prepare;
    Dm.DatasetInn.ParambyName('inn').AsString := inn;
    DM.DataSetInn.Open;
    DM.DataSetInn.FetchAll;

end;

procedure TfmAddRecordDoc.YesBtnClick(Sender: TObject);
begin
    if(id_man = null)  then
    Begin
        ShowMessage('Необхідно вибрати фізичну особу!');
        ButtonEditFio.SetFocus;
        Exit;
    end;
    if(id_prop_income = null)  then
    Begin
        ShowMessage('Необхідно вибрати ознаку документа!');
        ButtonEditProp.SetFocus;
        Exit;
    end;
    ModalResult := mrOk;
end;

procedure TfmAddRecordDoc.CancelBtnClick(Sender: TObject);
begin
    close;
end;

procedure TfmAddRecordDoc.ButtonEditPropPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
    AParameter: TPiParamPacks;
    res : variant;
begin
    AParameter := TPiParamPacks.Create;
    AParameter.Owner := self;
    AParameter.Db_Handle := dm.Db.Handle;
    AParameter.Formstyle := fsNormal;

    res := DoFunctionFromPackage(AParameter, ['Personal_income\Pi_SpPropIncome.bpl', 'ShowPiPropIncome']);
    AParameter.Free;

    if VarArrayDimCount(res)>0 then
    begin
        id_prop_income := res[0];
        ButtonEditProp.Text:= vartostr(res[1]);
    end;
end;


procedure TfmAddRecordDoc.ButtonEditPrivPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  Privilege:Variant;
begin
    Privilege:=LoadPrivileges(self,dm.DB.Handle,zTypes.zfsModal);
    if VarArrayDimCount(Privilege)> 0 then
      if Privilege[0]<>NULL then
      begin
          ButtonEditPriv.Text := Privilege[1];
          id_prop_pilg        := Privilege[0];
      end;
end;

procedure TfmAddRecordDoc.MaskEditSumNarKeyPress(Sender: TObject;
  var Key: Char);
begin
    if (Key = '-') then Key := Chr(0);
end;

procedure TfmAddRecordDoc.ButtonEditFIOPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var Man:variant;
    inn : variant;
begin
    Man:=LoadPeopleModal(Self,dm.DB.Handle);
    if VarArrayDimCount(Man)> 0 then
       If Man[0]<>NULL then
          begin
             ButtonEditFio.Text := VarToStrDef(Man[1],'')+' '+VarToStrDef(Man[2],'')+' '+VarToStrDef(Man[3],'');
             id_man := man[0];
             inn := Man[5];
             if((inn<=0)or(inn=null)) then
             begin
                 GetPassportData(id_man);
                 TextEditTn.Text := pass_data;
             end else
                 TextEditTn.Text := VarToStrDef(Man[5],'');
          end;
end;

procedure TfmAddRecordDoc.ButtonEditFIOKeyPress(Sender: TObject;
  var Key: Char);
begin
    key :=chr(0);
end;

procedure TfmAddRecordDoc.TextEditTnKeyPress(Sender: TObject;
  var Key: Char);
begin
   // if (Length(TextEditTn.Text)=10) and (Key<>#7) and (key<>#8) then Key:=#0;
end;

procedure TfmAddRecordDoc.TextEditTnExit(Sender: TObject);
var fam, im, otch : string;
begin
    if(TextEditTn.Text='') then exit;
    GetFioByInn(TextEditTn.Text);
    if(DM.DataSetInn['familia']=null) then
    begin
        fam := '';
    end
    else
        fam := DM.DataSetInn['familia'];

    if(DM.DataSetInn['imya']=null) then
        im := ''
    else
        im := DM.DataSetInn['imya'];

    if(DM.DataSetInn['otchestvo']=null) then
        otch := ''
    else
        otch := DM.DataSetInn['otchestvo'];

    ButtonEditFIO.Text := fam+' '+im+' '+otch;
    id_man             := DM.DataSetInn['id_man'];
end;

procedure TfmAddRecordDoc.MaskEditSumNarExit(Sender: TObject);
begin
    if(flag_doh=0) then
         MaskEditSumDoh.EditValue  := MaskEditSumNar.EditValue;

end;

procedure TfmAddRecordDoc.ButtonEditPropExit(Sender: TObject);
begin
    if(ButtonEditProp.Text<>'') then
    begin
        DM.DataSetProp.Close;
        DM.DataSetProp.SQLs.SelectSQL.Text := 'select * from PI_SP_PROP_INCOME p where p.kod_prop like '''+ButtonEditProp.Text+'''';
        DM.DataSetProp.Open;
        if(DM.DataSetProp['id_prop_income']<> null) then
            id_prop_income := DM.DataSetProp['id_prop_income']
        else
            id_prop_income := null;
    end;
end;

procedure TfmAddRecordDoc.MaskEditSumDohEditing(Sender: TObject;
  var CanEdit: Boolean);
begin
   flag_doh :=1;
end;

procedure TfmAddRecordDoc.MaskEditSumTaxDExit(Sender: TObject);
begin
     flag_tax := 1;
end;

procedure TfmAddRecordDoc.MaskEditSumTaxNExit(Sender: TObject);
begin
    if(flag_tax=0) then
         MaskEditSumTaxD.EditValue := MaskEditSumTaxN.EditValue;
end;

end.
