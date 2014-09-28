unit f1df_Ctrlm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
  ExtCtrls, cxCheckBox, cxDropDownEdit, cxCalendar, cxLookAndFeelPainters,
  StdCtrls, cxButtons, FIBQuery, pFIBQuery, pFIBStoredProc, FIBDatabase,
  pFIBDatabase, ActnList, cxLabel, iBase, PackageLoad,
  ZTypes, ZProc, Unit_ZGlobal_Consts, zMessages, cxButtonEdit, cxGraphics,
  dxStatusBar, Registry;

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
    dxStatusBar1: TdxStatusBar;
    Actions: TActionList;
    Action1: TAction;
    Action2: TAction;
    Action3: TAction;
    procedure ActionYesExecute(Sender: TObject);
    procedure ActionCancelExecute(Sender: TObject);
    procedure ButtonEditPrivPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure MaskEditTinKeyPress(Sender: TObject; var Key: Char);
    procedure MaskEditTinPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure Action2Execute(Sender: TObject);
    procedure RestoreFromBuffer(Sender:TObject);
    procedure FormShow(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
    PLanguageIndex:byte;
    PDb_handle:TISC_DB_HANDLE;
    PId:integer;
    PId1DfHeader:Integer;
    Pfs:TZControlFormStyle;
    ChIndex:integer;
  public
    constructor Create(AOwner:TComponent;DB_Handle:TISC_DB_HANDLE;
                       fs:TZControlFormStyle;Id:integer;ShowIsAdd:boolean=True;ChildIndex:integer=0);reintroduce;
    function DeleteRecord:boolean;
    function PrepareData:boolean;
    property Id:integer read PId;
  end;


function f1df_ctrl_show(AOwner:TComponent;DB_handle:TISC_DB_HANDLE;fs:TZControlFormStyle;ID:integer;ShowIsAdd:boolean=True;ChildIndex:integer=0):Variant;
implementation
{$R *.dfm}

function f1df_ctrl_show(AOwner:TComponent;DB_handle:TISC_DB_HANDLE;fs:TZControlFormStyle;ID:integer;ShowIsAdd:boolean=True;ChildIndex:integer=0):Variant;
var f1dfCtrl:Tf1DfCtrl;
begin
 f1dfCtrl := Tf1DfCtrl.Create(AOwner,DB_handle,fs,ID,ShowIsAdd,ChildIndex);
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
                       fs:TZControlFormStyle;Id:integer;ShowIsAdd:boolean=True;
                       ChildIndex:integer=0);
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
   ChIndex:=ChildIndex;
 //******************************************************************************
 dxStatusBar1.Panels[0].Text := 'F9 - '+'Занести до буфера';
 dxStatusBar1.Panels[1].Text := 'F10 - '+YesBtn.Caption;
 dxStatusBar1.Panels[2].Text := 'Esc - '+CancelBtn.Caption;
//******************************************************************************
end;

function Tf1DfCtrl.DeleteRecord:boolean;
begin
 Result := False;
 if ZShowMessage(Caption_Delete[PLanguageIndex],DeleteRecordQuestion_Text[PLanguageIndex],mtConfirmation,[mbYes,mbNo])=mrYes
    then
        try
         case ChIndex of
         0:
          begin
           DB.Handle := PDb_handle;
           StProc.StoredProcName := 'Z_1DF_REPORT_D';
           StProc.Transaction.StartTransaction;
           StProc.Prepare;
           StProc.ParamByName('ID').AsInteger := Pid;
           StProc.ExecProc;
           StProc.Transaction.Commit;
           Result:=True;
          end;
         2:
          begin
           DB.Handle := PDb_handle;
           StProc.StoredProcName := 'Z_1DF_TEMP_D';
           StProc.Transaction.StartTransaction;
           StProc.Prepare;
           StProc.ParamByName('ID').AsInteger := Pid;
           StProc.ExecProc;
           StProc.Transaction.Commit;
           Result:=True;
          end;
         end;
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
     case ChIndex of
     0:
     begin
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
     end;
     2:
     begin
      DB.Handle := PDb_handle;
      StProc.StoredProcName := 'Z_1DF_TEMP_S_BY_KEY';
      StProc.Transaction.StartTransaction;
      StProc.Prepare;
      StProc.ParamByName('ID').AsInteger := PId;
      StProc.ExecProc;
      MaskEditFio.Text      := VarToStrDef(StProc.ParamByName('FIO').AsVariant,'');
      MaskEditTin.Text      := varToStrDef(StProc.ParamByName('TIN').AsVariant,'');
      if VarIsNull(StProc.ParamByName('s_nar').AsVariant)
        then MaskEditSumNar.Text := ''
        else MaskEditSumNar.Text   := FloatToStrF(StProc.ParamByName('s_nar').AsFloat,ffFixed,16,2);
      if VarIsNull(StProc.ParamByName('S_DOH').AsVariant)
        then MaskEditSumVipl.Text := ''
        else MaskEditSumVipl.Text   := FloatToStrF(StProc.ParamByName('S_DOH').AsFloat,ffFixed,16,2);
      if VarIsNull(StProc.ParamByName('S_TAXN').AsVariant)
        then MaskEditSumUd.Text := ''
        else MaskEditSumUd.Text   := FloatToStrF(StProc.ParamByName('S_TAXN').AsFloat,ffFixed,16,2);
      if VarIsNull(StProc.ParamByName('S_TAXP').AsVariant)
        then MaskEditSumPerer.Text := ''
        else MaskEditSumPerer.Text   := FloatToStrF(StProc.ParamByName('S_TAXP').AsFloat,ffFixed,16,2);
      if VarIsNull(StProc.ParamByName('D_PRIYN').AsVariant)
        then DateEditCame.EditValue := NULL
        else DateEditCame.Date := StProc.ParamByName('D_PRIYN').AsDate;
      if VarIsNull(StProc.ParamByName('D_ZVILN').AsVariant)
        then DateEditLeave.EditValue := Null
        else DateEditLeave.Date := StProc.ParamByName('D_ZVILN').AsDate;
      if VarIsNull(StProc.ParamByName('ozn_pilg').AsInteger)
        then ButtonEditPriv.Text:=''
        else ButtonEditPriv.Text:= StProc.ParamByName('ozn_pilg').AsString;
      if VarIsNull(StProc.ParamByName('ozn_doh').AsVariant)
        then MaskEditKod1Df.Text:=''
        else MaskEditKod1Df.Text:=StProc.ParamByName('ozn_doh').AsString;
   // CheckBoxIsAdd.EditValue := StProc.ParamByName('IS_ADD').AsVariant;
   // MaskEditKod1Df.Text   := VarToStrDef(StProc.ParamByName('KOD_1DF').AsVariant,'');
   // ButtonEditPriv.Text   := VarToStrDef(StProc.ParamByName('KOD_PRIV').AsVariant,'');
      StProc.Transaction.Commit;
      Result:=True;
     end;
     end;
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
   case ChIndex of
   0:
   begin
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
    end;
    2:
    begin
     StProc.StoredProcName := 'Z_1DF_TEMP_S_BY_KEY';
     StProc.Transaction.StartTransaction;
     StProc.Prepare;
     StProc.ParamByName('ID').AsInteger := PId;
     StProc.ExecProc;
     MaskEditFio.Text      := VarToStrDef(StProc.ParamByName('FIO').AsVariant,'');
     MaskEditTin.Text      := varToStrDef(StProc.ParamByName('TIN').AsVariant,'');
     if VarIsNull(StProc.ParamByName('s_nar').AsVariant)
       then MaskEditSumNar.Text := ''
       else MaskEditSumNar.Text   := FloatToStrF(StProc.ParamByName('s_nar').AsFloat,ffFixed,16,2);
     if VarIsNull(StProc.ParamByName('S_DOH').AsVariant)
       then MaskEditSumVipl.Text := ''
       else MaskEditSumVipl.Text   := FloatToStrF(StProc.ParamByName('S_DOH').AsFloat,ffFixed,16,2);
     if VarIsNull(StProc.ParamByName('S_TAXN').AsVariant)
       then MaskEditSumUd.Text := ''
       else MaskEditSumUd.Text   := FloatToStrF(StProc.ParamByName('S_TAXN').AsFloat,ffFixed,16,2);
     if VarIsNull(StProc.ParamByName('S_TAXP').AsVariant)
       then MaskEditSumPerer.Text := ''
       else MaskEditSumPerer.Text   := FloatToStrF(StProc.ParamByName('S_TAXP').AsFloat,ffFixed,16,2);
     if VarIsNull(StProc.ParamByName('D_PRIYN').AsVariant)
       then DateEditCame.EditValue := NULL
       else DateEditCame.Date := StProc.ParamByName('D_PRIYN').AsDate;
     if VarIsNull(StProc.ParamByName('D_ZVILN').AsVariant)
       then DateEditLeave.EditValue := Null
       else DateEditLeave.Date := StProc.ParamByName('D_ZVILN').AsDate;
     if VarIsNull(StProc.ParamByName('ozn_doh').AsVariant)
       then MaskEditKod1Df.Text:=''
       else MaskEditKod1Df.Text:=StProc.ParamByName('ozn_doh').AsString;
     if VarIsNull(StProc.ParamByName('ozn_pilg').AsInteger)
       then ButtonEditPriv.Text:=''
       else ButtonEditPriv.Text:= StProc.ParamByName('ozn_pilg').AsString;
   // CheckBoxIsAdd.EditValue := StProc.ParamByName('IS_ADD').AsVariant;
   // MaskEditKod1Df.Text   := VarToStrDef(StProc.ParamByName('KOD_1DF').AsVariant,'');
   // ButtonEditPriv.Text   := VarToStrDef(StProc.ParamByName('KOD_PRIV').AsVariant,'');
     StProc.Transaction.Commit;
     Result:=True;
   end;
   end;
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
  case ChIndex of
  0:
  begin
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
 end;
 2:
 begin
   case pfs of
    zcfsInsert: StoredProcName := 'Z_1DF_TEMP_I';
    zcfsUpdate: StoredProcName := 'Z_1DF_TEMP_U';
   end;
   Transaction.StartTransaction;
   Prepare;
   if MaskEditTin.Text=''
     then ParamByName('TIN').AsVariant := NULL
     else ParamByName('TIN').AsString  := MaskEditTin.Text;
   ParamByName('TIN').AsVariant := ParamByName('TIN').AsVariant;
   if MaskEditSumNar.Text=''
     then ParamByName('s_nar').AsFloat    := 0
     else ParamByName('s_nar').AsFloat    := StrToFloat(MaskEditSumNar.Text);
   if MaskEditSumVipl.Text=''
     then ParamByName('s_doh').AsFloat   := 0
     else ParamByName('s_doh').AsFloat   := StrToFloat(MaskEditSumVipl.Text);
   if MaskEditSumUd.Text=''
     then ParamByName('s_taxn').AsFloat  := 0
     else ParamByName('s_taxn').AsFloat  := StrToFloat(MaskEditSumUd.Text);
   if MaskEditSumPerer.Text=''
     then ParamByName('s_taxp').AsFloat  := 0
     else ParamByName('s_taxp').AsFloat  := StrToFloat(MaskEditSumPerer.Text);
   if DateToStr(DateEditCame.Date)='00.00.0000'
     then ParamByName('d_priyn').AsVariant := NULL
     else ParamByName('d_priyn').AsDate  := DateEditCame.Date;
   if DateToStr(DateEditLeave.Date)='00.00.0000'
     then ParamByName('d_zviln').AsVariant := NULL
     else ParamByName('d_zviln').AsDate  := DateEditLeave.Date;
   if MaskEditFio.Text=''
     then ParamByName('FIO').AsVariant := NULL
     else ParamByName('FIO').AsString  := MaskEditFio.Text;
   if MaskEditKod1Df.Text=''
     then ParamByName('ozn_doh').AsVariant := NULL
     else ParamByName('ozn_doh').AsInteger := StrToInt(MaskEditKod1Df.Text);
   ParamByName('ID_1DF_HEADER').AsInteger := PId1DfHeader;
   if ButtonEditPriv.Text=''
     then ParamByName('ozn_pilg').AsInteger := 0
     else ParamByName('ozn_pilg').AsInteger := StrToInt(ButtonEditPriv.Text);
   {ParamByName('IS_ADD').AsString := CheckBoxIsAdd.EditValue;}
  // if Pfs=zcfsUpdate then ParamByName('ID').AsInteger:=PId;
  //  if Pfs=zcfsinsert then PId:=ParamByName('ID').AsInteger;
   ExecProc;
   Transaction.Commit;
   ModalResult := mrYes;
 end;
 end;
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

procedure Tf1DfCtrl.Action2Execute(Sender: TObject);
var reg: TRegistry;
    Key:string;
begin
 CancelBtn.SetFocus;
 Key := '\Software\Zarplata\F1dfCtrl';
 reg:=TRegistry.Create;

 try
  reg.RootKey:=HKEY_CURRENT_USER;
  reg.OpenKey(Key,True);
  reg.WriteString('IsBuffer','1');
  reg.WriteString('Tin',MaskEditTin.Text);
  reg.WriteString('FIO',MaskEditFio.Text);
  if((MaskEditSumNar.Text<>''){ or (MaskEditSumNar.Text<>'0.00')}) then
    reg.WriteCurrency('SummaNar',StrToFloat(MaskEditSumNar.Text));
  if((MaskEditSumVipl.Text<>''){ or (MaskEditSumVipl.Text<>'0.00')}) then
    reg.WriteCurrency('SummaVipl',StrToFloat(MaskEditSumVipl.Text));
  if((MaskEditSumUd.Text<>''){ or (MaskEditSumUd.Text<>'0.00')}) then
    reg.WriteCurrency('SummaUd',StrToFloat(MaskEditSumUd.Text));
  if((MaskEditSumPerer.Text<>''){ or (MaskEditSumPerer.Text<>'0.00')}) then
    reg.WriteCurrency('SummaPerer',StrToFloat(MaskEditSumPerer.Text));
  if(DateEditCame.EditValue<>null) then
    reg.WriteDate('DateCame',DateEditCame.EditValue);
  if(DateEditLeave.EditValue<>null) then
    reg.WriteDate('DateLeave',DateEditLeave.EditValue);
  if(MaskEditKod1Df.Text<>'') then
    reg.WriteCurrency('Kod1Df',StrToFloat(MaskEditKod1Df.Text));
  reg.WriteString('Priv',ButtonEditPriv.Text);
 finally
  reg.Free;
 end;
end;

procedure Tf1DfCtrl.RestoreFromBuffer(Sender:TObject);
var reg:TRegistry;
    Kod:integer;
    Key:string;
begin
  Key := '\Software\Zarplata\F1dfCtrl';

  reg := TRegistry.Create;
  reg.RootKey:=HKEY_CURRENT_USER;
  if not reg.OpenKey(Key,False) then
   begin
    reg.free;
    Exit;
   end;

  if reg.ReadString('IsBuffer')<>'1' then
  begin
   reg.Free;
   exit;
  end;
 //try
  MaskEditTin.Text := reg.ReadString('Tin');
  MaskEditFio.Text := reg.ReadString('FIO');
  if(reg.ValueExists('SummaNar')) then
    MaskEditSumNar.Text:=FloatToStr(reg.ReadCurrency('SummaNar'))
  else
    MaskEditSumNar.Text:='';
  if(reg.ValueExists('SummaVipl')) then
    MaskEditSumVipl.Text:=FloatToStr(reg.ReadCurrency('SummaVipl'))
  else
    MaskEditSumVipl.Text:='';
  if(reg.ValueExists('SummaUd')) then
    MaskEditSumUd.Text:=FloatToStr(reg.ReadCurrency('SummaUd'))
  else
    MaskEditSumUd.Text:='';
  if(reg.ValueExists('SummaPerer')) then
    MaskEditSumPerer.Text:=FloatToStr(reg.ReadCurrency('SummaPerer'))
  else
    MaskEditSumPerer.Text:='';
  if(reg.ValueExists('DateCame')) then
    DateEditCame.EditValue:=reg.ReadDate('DateCame')
  else
    DateEditCame.EditValue:=null;
  if(reg.ValueExists('DateLeave')) then
    DateEditLeave.EditValue:=reg.ReadDate('DateLeave')
  else
    DateEditLeave.EditValue:=null;
  if(reg.ValueExists('Kod1Df')<>Null) then
    MaskEditKod1Df.Text:=FloatToStr(reg.ReadCurrency('Kod1Df'))
  else
    MaskEditKod1Df.Text:='';
  ButtonEditPriv.Text := reg.ReadString('Priv');

 //finally
  DateEditCame.SetFocus;
  Reg.Free;
 //end;
end;

procedure Tf1DfCtrl.FormShow(Sender: TObject);
begin
  if Pfs=zcfsInsert then RestoreFromBuffer(self);
  FormResize(sender);
end;

procedure Tf1DfCtrl.FormResize(Sender: TObject);
var
  i:byte;
begin
for i:=0 to dxStatusBar1.Panels.Count-1 do
    dxStatusBar1.Panels[i].Width := Width div dxStatusBar1.Panels.Count;
end;

end.
