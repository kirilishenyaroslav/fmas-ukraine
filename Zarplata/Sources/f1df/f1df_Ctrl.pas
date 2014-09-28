unit f1df_Ctrl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
  ExtCtrls, cxCheckBox, cxDropDownEdit, cxCalendar, cxLookAndFeelPainters,
  StdCtrls, cxButtons, FIBQuery, pFIBQuery, pFIBStoredProc, FIBDatabase,
  pFIBDatabase, ActnList, cxLabel, iBase, PackageLoad,
  ZTypes, ZProc, Unit_ZGlobal_Consts, zMessages, cxButtonEdit;

type
  Tf1DfCtrl = class(TForm)
    PanelMan: TPanel;
    MaskEditFio: TcxMaskEdit;
    Bevel1: TBevel;
    PanelData: TPanel;
    MaskEditSumPerer: TcxMaskEdit;
    MaskEditSumVipl: TcxMaskEdit;
    MaskEditSumNar: TcxMaskEdit;
    MaskEditSumUd: TcxMaskEdit;
    DateEditCame: TcxDateEdit;
    DateEditLeave: TcxDateEdit;
    MaskEditKod1Df: TcxMaskEdit;
    Bevel2: TBevel;
    YesBtn: TcxButton;
    CancelBtn: TcxButton;
    ActionList: TActionList;
    DB: TpFIBDatabase;
    DefaultTransaction: TpFIBTransaction;
    StProc: TpFIBStoredProc;
    LabelFIO: TcxLabel;
    LabelTin: TcxLabel;
    LabelSumNar: TcxLabel;
    LabelSumVipl: TcxLabel;
    LabelSumUd: TcxLabel;
    LabelSumPerer: TcxLabel;
    LabelDateCame: TcxLabel;
    LabelDateLeave: TcxLabel;
    LabelKod1DF: TcxLabel;
    ActionYes: TAction;
    ActionCancel: TAction;
    LabelPriv: TcxLabel;
    ButtonEditPriv: TcxButtonEdit;
    MaskEditTin: TcxButtonEdit;
    CheckBoxIsAdd: TcxCheckBox;
    procedure ActionYesExecute(Sender: TObject);
    procedure ActionCancelExecute(Sender: TObject);
    procedure ButtonEditPrivPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure MaskEditTinKeyPress(Sender: TObject; var Key: Char);
    procedure MaskEditTinPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private
    PLanguageIndex:byte;
    PDb_handle:TISC_DB_HANDLE;
    PId:integer;
    PId1DfHeader:Integer;
    Pfs:TZControlFormStyle;
  public
    constructor Create(AOwner:TComponent;DB_Handle:TISC_DB_HANDLE;
                       fs:TZControlFormStyle;Id:integer;ShowIsAdd:boolean=True);reintroduce;
    function DeleteRecord:boolean;
    function PrepareData:boolean;
    property Id:integer read PId;
  end;


function f1df_ctrl_show(AOwner:TComponent;DB_handle:TISC_DB_HANDLE;fs:TZControlFormStyle;ID:integer;ShowIsAdd:boolean=True):Variant;
implementation
{$R *.dfm}

function f1df_ctrl_show(AOwner:TComponent;DB_handle:TISC_DB_HANDLE;fs:TZControlFormStyle;ID:integer;ShowIsAdd:boolean=True):Variant;
var f1dfCtrl:Tf1DfCtrl;
begin
 f1dfCtrl := Tf1DfCtrl.Create(AOwner,DB_handle,fs,ID,ShowIsAdd);
 if fs=zcfsDelete then result:=f1dfCtrl.DeleteRecord
                  else
                       begin
                        if f1dfCtrl.PrepareData then
                          begin
                           if f1dfCtrl.ShowModal=mrYes then
                              Result:=f1dfCtrl.id
                           else Result:=0;
                          end;
                       end;
 f1dfCtrl.Destroy;
end;

constructor Tf1DfCtrl.Create(AOwner:TComponent;DB_Handle:TISC_DB_HANDLE;
                       fs:TZControlFormStyle;Id:integer;ShowIsAdd:boolean=True);
begin
  inherited Create(AOwner);
  PLanguageIndex         := LanguageIndex;
  if fs<>zcfsInsert
     then  PId    := Id
     else  PId1DfHeader := Id;
  Pfs                    := fs;
//------------------------------------------------------------------------------
  PDB_Handle                       := DB_Handle;
  LabelFIO.Caption                 := LabelFIO_Caption[PLanguageIndex];
  LabelTin.Caption                 := LabelTin_Caption[PLanguageIndex];
  LabelSumNar.Caption              := LabelSumNar_Caption[PLanguageIndex];
  LabelSumVipl.Caption             := LabelSumVipl_Caption[PLanguageIndex];
  LabelSumUd.Caption               := LabelSumUd_Caption[PLanguageIndex];
  LabelSumPerer.Caption            := LabelSumPerer_Caption[PLanguageIndex];
  LabelDateCame.Caption            := LabelDateCame_Caption[PLanguageIndex];
  LabelDateLeave.Caption           := LabelDateLeave_Caption[PLanguageIndex];
  LabelKod1DF.Caption              := LabelKod1DF_Caption[PLanguageIndex];
  LabelPriv.Caption                := LabelPrivilege_Caption[PLanguageIndex];
  YesBtn.Caption                   := YesBtn_Caption[PLanguageIndex];
  CancelBtn.Caption                := CancelBtn_Caption[PLanguageIndex];
  CheckBoxIsAdd.Properties.Caption := Caption_Insert[PLanguageIndex];
  CheckBoxIsAdd.Visible            := ShowIsAdd;
//------------------------------------------------------------------------------
  MaskEditSumVipl.Properties.MaskKind := emkRegExpr;
  MaskEditSumNar.Properties.MaskKind := emkRegExpr;
  MaskEditSumUd.Properties.MaskKind := emkRegExpr;
  MaskEditSumPerer.Properties.MaskKind := emkRegExpr;
  MaskEditSumVipl.Properties.EditMask := '[-]?\d\d?\d?\d?\d?\d?\d?\d?\d?\d?\d?\d?\d? (['+ZSystemDecimalSeparator+']\d\d?)?';
  MaskEditSumUd.Properties.EditMask := '[-]?\d\d?\d?\d?\d?\d?\d?\d?\d?\d?\d?\d?\d? (['+ZSystemDecimalSeparator+']\d\d?)?';
  MaskEditSumNar.Properties.EditMask := '[-]?\d\d?\d?\d?\d?\d?\d?\d?\d?\d?\d?\d?\d? (['+ZSystemDecimalSeparator+']\d\d?)?';
  MaskEditSumPerer.Properties.EditMask := '[-]?\d\d?\d?\d?\d?\d?\d?\d?\d?\d?\d?\d?\d? (['+ZSystemDecimalSeparator+']\d\d?)?';

  case fs of
   zcfsInsert      : Caption := Caption_Insert[PLanguageIndex];
   zcfsUpdate      : Caption := Caption_Update[PLanguageIndex];
   zcfsShowDetails : Caption := Caption_Detail[PLanguageIndex];
   zcfsDelete      : Caption := Caption_Delete[PLanguageIndex];
  end;
   DateEditCame.Text  := '';
   DateEditLeave.Text := '';
end;

function Tf1DfCtrl.DeleteRecord:boolean;
begin
 Result := False;
 if ZShowMessage(Caption_Delete[PLanguageIndex],DeleteRecordQuestion_Text[PLanguageIndex],mtConfirmation,[mbYes,mbNo])=mrYes
    then
        try
         DB.Handle := PDb_handle;
         StProc.StoredProcName := 'Z_1DF_REPORT_D';
         StProc.Transaction.StartTransaction;
         StProc.Prepare;
         StProc.ParamByName('ID').AsInteger := Pid;
         StProc.ExecProc;
         StProc.Transaction.Commit;
         Result:=True;
        except
         on e:exception do
          begin
           StProc.Transaction.Rollback;
           ZShowMessage(Error_Caption[PLanguageIndex],e.Message,mtError,[mbOK]);
          end;
        end;
end;

function Tf1DfCtrl.PrepareData;
//var Man:Variant;
begin
 Result := False;
 case Pfs of
  zcfsInsert:
   begin
     Result:=True;
{    Man:=LoadPeopleModal(Self,PDB_Handle);
    if VarArrayDimCount(Man)> 0 then
       If Man[0]<>NULL then
          begin
           MaskEditFio.Text := VarToStrDef(Man[1],'')+' '+VarToStrDef(Man[2],'')+' '+VarToStrDef(Man[3],'');
           MaskEditTin.Text := VarToStrDef(Man[5],'');
           Result       := True;
          end;}
   end;
  zcfsUpdate:
   try
    DB.Handle := PDb_handle;
    StProc.StoredProcName := 'Z_1DF_REPORT_S_BY_KEY';
    StProc.Transaction.StartTransaction;
    StProc.Prepare;
    StProc.ParamByName('IN_ID').AsInteger := PId;
    StProc.ExecProc;
    PId1DfHeader          := StProc.ParamByName('ID_1DF').AsInteger;
    MaskEditFio.Text      := VarToStrDef(StProc.ParamByName('FIO').AsVariant,'');
    MaskEditTin.Text      := varToStrDef(StProc.ParamByName('TIN_PASPORT').AsVariant,'');
    if VarIsNull(StProc.ParamByName('SUM_NAR').AsVariant)
       then MaskEditSumNar.Text := ''
       else MaskEditSumNar.Text   := FloatToStrF(StProc.ParamByName('SUM_NAR').AsFloat,ffFixed,16,2);
    if VarIsNull(StProc.ParamByName('SUM_VIPL').AsVariant)
       then MaskEditSumVipl.Text := ''
       else MaskEditSumVipl.Text   := FloatToStrF(StProc.ParamByName('SUM_VIPL').AsFloat,ffFixed,16,2);
    if VarIsNull(StProc.ParamByName('SUM_UD').AsVariant)
       then MaskEditSumUd.Text := ''
       else MaskEditSumUd.Text   := FloatToStrF(StProc.ParamByName('SUM_UD').AsFloat,ffFixed,16,2);
    if VarIsNull(StProc.ParamByName('SUM_PERER').AsVariant)
       then MaskEditSumPerer.Text := ''
       else MaskEditSumPerer.Text   := FloatToStrF(StProc.ParamByName('SUM_PERER').AsFloat,ffFixed,16,2);
    if VarIsNull(StProc.ParamByName('DATE_CAME').AsVariant)
       then DateEditCame.EditValue := NULL
       else DateEditCame.Date := StProc.ParamByName('DATE_CAME').AsDate;
    if VarIsNull(StProc.ParamByName('DATE_LEAVE').AsVariant)
       then DateEditLeave.EditValue := Null
       else DateEditLeave.Date := StProc.ParamByName('DATE_LEAVE').AsDate;
    MaskEditKod1Df.Text   := VarToStrDef(StProc.ParamByName('KOD_1DF').AsVariant,'');
    ButtonEditPriv.Text   := VarToStrDef(StProc.ParamByName('KOD_PRIV').AsVariant,'');
    CheckBoxIsAdd.EditValue := StProc.ParamByName('IS_ADD').AsVariant;
    StProc.Transaction.Commit;
    Result:=True;
   except
    on e:exception do
     begin
      ZShowMessage(Error_Caption[PLanguageIndex],e.Message,mtError,[mbOk]);
      StProc.Transaction.Rollback;
     end;
   end;
  zcfsShowDetails:
   try
    PanelMan.Enabled  := False;
    PanelData.Enabled := False;
    YesBtn.Visible    := False;
    CancelBtn.Caption := ExitBtn_Caption[PLanguageIndex];
    DB.Handle := PDb_handle;
    CheckBoxIsAdd.Properties.ReadOnly := True;
    StProc.StoredProcName := 'Z_1DF_REPORT_S_BY_KEY';
    StProc.Transaction.StartTransaction;
    StProc.Prepare;
    StProc.ParamByName('IN_ID').AsInteger := PId;
    StProc.ExecProc;
    MaskEditFio.Text      := VarToStrDef(StProc.ParamByName('FIO').AsVariant,'');
    MaskEditTin.Text      := varToStrDef(StProc.ParamByName('TIN_PASPORT').AsVariant,'');
    if VarIsNull(StProc.ParamByName('SUM_NAR').AsVariant)
       then MaskEditSumNar.Text := ''
       else MaskEditSumNar.Text   := FloatToStrF(StProc.ParamByName('SUM_NAR').AsFloat,ffFixed,16,2);
    if VarIsNull(StProc.ParamByName('SUM_VIPL').AsVariant)
       then MaskEditSumVipl.Text := ''
       else MaskEditSumVipl.Text   := FloatToStrF(StProc.ParamByName('SUM_VIPL').AsFloat,ffFixed,16,2);
    if VarIsNull(StProc.ParamByName('SUM_UD').AsVariant)
       then MaskEditSumUd.Text := ''
       else MaskEditSumUd.Text   := FloatToStrF(StProc.ParamByName('SUM_UD').AsFloat,ffFixed,16,2);
    if VarIsNull(StProc.ParamByName('SUM_PERER').AsVariant)
       then MaskEditSumPerer.Text := ''
       else MaskEditSumPerer.Text   := FloatToStrF(StProc.ParamByName('SUM_PERER').AsFloat,ffFixed,16,2);
    if VarIsNull(StProc.ParamByName('DATE_CAME').AsVariant)
       then DateEditCame.EditValue := NULL
       else DateEditCame.Date := StProc.ParamByName('DATE_CAME').AsDate;
    if VarIsNull(StProc.ParamByName('DATE_LEAVE').AsVariant)
       then DateEditLeave.EditValue := Null
       else DateEditLeave.Date := StProc.ParamByName('DATE_LEAVE').AsDate;
    CheckBoxIsAdd.EditValue := StProc.ParamByName('IS_ADD').AsVariant;
    MaskEditKod1Df.Text   := VarToStrDef(StProc.ParamByName('KOD_1DF').AsVariant,'');
    ButtonEditPriv.Text   := VarToStrDef(StProc.ParamByName('KOD_PRIV').AsVariant,'');
    StProc.Transaction.Commit;
    Result:=True;
   except
    on e:exception do
     begin
      ZShowMessage(Error_Caption[PLanguageIndex],e.Message,mtError,[mbOk]);
      StProc.Transaction.Rollback;
     end;
   end;
 end;
end;

procedure Tf1DfCtrl.ActionYesExecute(Sender: TObject);
begin
  DB.Handle := PDb_handle;
with StProc do
 try
  case pfs of
   zcfsInsert: StoredProcName := 'Z_1DF_REPORT_I';
   zcfsUpdate: StoredProcName := 'Z_1DF_REPORT_U';
  end;
  Transaction.StartTransaction;
  Prepare;
  if MaskEditTin.Text=''
     then ParamByName('TIN_PASPORT').AsVariant := NULL
     else ParamByName('TIN_PASPORT').AsString  := MaskEditTin.Text;
  ParamByName('TIN').AsVariant := ParamByName('TIN_PASPORT').AsVariant;

  if MaskEditSumNar.Text=''
     then ParamByName('SUM_NAR').AsFloat    := 0
     else ParamByName('SUM_NAR').AsFloat    := StrToFloat(MaskEditSumNar.Text);
  if MaskEditSumVipl.Text=''
     then ParamByName('SUM_VIPL').AsFloat   := 0
     else ParamByName('SUM_VIPL').AsFloat   := StrToFloat(MaskEditSumVipl.Text);
  if MaskEditSumUd.Text=''
     then ParamByName('SUM_UD').AsFloat  := 0
     else ParamByName('SUM_UD').AsFloat  := StrToFloat(MaskEditSumUd.Text);
  if MaskEditSumPerer.Text=''
     then ParamByName('SUM_PERER').AsFloat  := 0
     else ParamByName('SUM_PERER').AsFloat  := StrToFloat(MaskEditSumPerer.Text);
  if DateToStr(DateEditCame.Date)='00.00.0000'
     then ParamByName('DATE_CAME').AsVariant := NULL
     else ParamByName('DATE_CAME').AsDate  := DateEditCame.Date;
  if DateToStr(DateEditLeave.Date)='00.00.0000'
     then ParamByName('DATE_LEAVE').AsVariant := NULL
     else ParamByName('DATE_LEAVE').AsDate  := DateEditLeave.Date;
  if MaskEditFio.Text=''
     then ParamByName('FIO').AsVariant := NULL
     else ParamByName('FIO').AsString  := MaskEditFio.Text;
  if MaskEditKod1Df.Text=''
     then ParamByName('KOD_1DF').AsVariant := NULL
     else ParamByName('KOD_1DF').AsInteger := StrToInt(MaskEditKod1Df.Text);
  ParamByName('ID_1DF_HEADER').AsInteger := PId1DfHeader;
  if ButtonEditPriv.Text=''
     then ParamByName('KOD_PRIV').AsInteger := 0
     else ParamByName('KOD_PRIV').AsInteger := StrToInt(ButtonEditPriv.Text);
  ParamByName('IS_ADD').AsString := CheckBoxIsAdd.EditValue;

  if Pfs=zcfsUpdate then ParamByName('ID').AsInteger:=PId;
  ExecProc;
  if Pfs=zcfsinsert then PId:=ParamByName('ID').AsInteger;
  Transaction.Commit;
  ModalResult := mrYes;
 except
  on e:exception do
   begin
    ZShowMessage(Error_Caption[PLanguageIndex],e.Message,mtError,[mbOk]);
    Transaction.Rollback;
   end;
 end;
end;

procedure Tf1DfCtrl.ActionCancelExecute(Sender: TObject);
begin
ModalResult:=mrCancel;
end;

procedure Tf1DfCtrl.ButtonEditPrivPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var Priv:variant;
begin
Priv:=LoadPrivileges(self,PDb_handle,zfsModal);
if VarArrayDimCount(Priv)> 0 then
  ButtonEditPriv.Text := VarToStrDef(Priv[7],'')
end;

procedure Tf1DfCtrl.MaskEditTinKeyPress(Sender: TObject; var Key: Char);
begin
if (Length(MaskEditTin.Text)=10) and (Key<>#7) and (key<>#8) then Key:=#0;
end;

procedure Tf1DfCtrl.MaskEditTinPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var Man:variant;
begin
    Man:=LoadPeopleModal(Self,PDB_Handle);
    if VarArrayDimCount(Man)> 0 then
       If Man[0]<>NULL then
          begin
           MaskEditFio.Text := VarToStrDef(Man[1],'')+' '+VarToStrDef(Man[2],'')+' '+VarToStrDef(Man[3],'');
           MaskEditTin.Text := VarToStrDef(Man[5],'');
          end;
end;

end.
