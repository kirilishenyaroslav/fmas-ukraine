//******************************************************************************
//                              Пакет для редактирования записи
//                   из таблицы Z_Current - зарплатные текущие выплаты
// Параметры: AOwner - компонент от которого создается форма для редактирования
//            DB_Handle - база для подключения
//            AZControlFormStyle - тип формы: редактрирование, удаление, добавление, просмотр
//            AID - если добавление, то RMoving, иначе ID_Current
//******************************************************************************

unit Current_ZarControl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, ExtCtrls, cxMaskEdit, cxDropDownEdit,
  cxCalendar, cxTextEdit, cxButtonEdit, cxContainer, cxEdit, cxLabel,
  cxControls, cxGroupBox, StdCtrls, cxButtons, Registry,
  PackageLoad, DB, FIBDatabase, pFIBDatabase, FIBDataSet, pFIBDataSet, IBase,
  ZTypes, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, GlobalSpr,
  cxDBEdit, cxSpinEdit, cxMemo, Dates, cxCalc, FIBQuery, pFIBQuery,
  pFIBStoredProc, ZProc, ZMessages, ActnList, Unit_ZGlobal_Consts,
  Current_Dmodule, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxDBData, cxGridTableView, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridDBTableView, cxGrid, Unit_NumericConsts,
  dxStatusBar, Menus, CurrentCtrl_AutoSumma,
  CurrentCtrl_ByHours, CurrentCtrl_ByAvg, CurrentCtrl_ByPrev, cxCheckBox, CurrentCtrl_ByAvgSm;

type
  TFZCurrentControl = class(TForm)
    YesBtn: TcxButton;
    CancelBtn: TcxButton;
    BoxMain: TcxGroupBox;
    PrikazBox: TcxGroupBox;
    EditPrikaz: TcxMaskEdit;
    LabelPrikaz: TcxLabel;
    LabelPeriod: TcxLabel;
    MonthesList: TcxComboBox;
    YearSpinEdit: TcxSpinEdit;
    LabelSumma: TcxLabel;
    Bevel2: TBevel;
    IdMovingBox: TcxGroupBox;
    LabelManMoving: TcxLabel;
    LabelMan: TcxLabel;
    EditMan: TcxDBButtonEdit;
    ActionList1: TActionList;
    Action1: TAction;
    Grid1DBTableView1: TcxGridDBTableView;
    Grid1Level1: TcxGridLevel;
    Grid1: TcxGrid;
    cxStyleRepository1: TcxStyleRepository;
    GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    cxStyle5: TcxStyle;
    cxStyle6: TcxStyle;
    cxStyle7: TcxStyle;
    cxStyle8: TcxStyle;
    cxStyle9: TcxStyle;
    cxStyle10: TcxStyle;
    cxStyle11: TcxStyle;
    cxStyle12: TcxStyle;
    cxStyle13: TcxStyle;
    cxStyle14: TcxStyle;
    Grid1ClDepartment: TcxGridDBColumn;
    Grid1ClCategory: TcxGridDBColumn;
    Grid1ClDateBeg: TcxGridDBColumn;
    Grid1ClDateEnd: TcxGridDBColumn;
    BoxChild: TcxGroupBox;
    EditSmeta: TcxButtonEdit;
    LabelSmeta: TcxLabel;
    LabelSmetaName: TcxLabel;
    LabelVidOpl: TcxLabel;
    EditVidOpl: TcxButtonEdit;
    LabelVidOplName: TcxLabel;
    Action2: TAction;
    dxStatusBar1: TdxStatusBar;
    SummaPopupMenu: TPopupMenu;
    SummaByHoursBtn: TMenuItem;
    SummaAverageBtn: TMenuItem;
    SummaPrevPeriodBtn: TMenuItem;
    UpdateSvodsBtn: TMenuItem;
    CheckBoxNowPay: TcxCheckBox;
    SummaAvgSmetsBtn: TMenuItem;
    LabelRmoving: TcxLabel;
    GridRmoving: TcxGrid;
    GridRmovingDBTableView1: TcxGridDBTableView;
    Grd2ClRMoving: TcxGridDBColumn;
    Grid2ClPeriodBeg: TcxGridDBColumn;
    Grid2ClPeriodEnd: TcxGridDBColumn;
    Grid2ClNameSovmest: TcxGridDBColumn;
    GridRmovingLevel1: TcxGridLevel;
    Grid1ClOklad: TcxGridDBColumn;
    Action3: TAction;
    EditSumma: TcxCalcEdit;
    EditPrikazB: TcxButtonEdit;
    CheckDS: TpFIBDataSet;
    Label1: TLabel;
    LabelHours: TcxLabel;
    EditHours: TcxCalcEdit;
    LabelTarif: TcxLabel;
    EditTarif: TcxCalcEdit;
    procedure CancelBtnClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
    procedure EditVidOplExit(Sender: TObject);
    procedure EditSmetaExit(Sender: TObject);
    procedure Grid1ClDepartmentGetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: String);
    procedure MonthesListExit(Sender: TObject);
    procedure EditSmetaPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure EditVidOplPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure RestoreFromBuffer(Sender:TObject);
    procedure Action2Execute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SummaByHoursBtnClick(Sender: TObject);
    procedure SummaAverageBtnClick(Sender: TObject);
    procedure SummaPopupMenuPopup(Sender: TObject);
    procedure SummaPrevPeriodBtnClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure UpdateSvodsBtnClick(Sender: TObject);
    procedure SummaAvgSmetsBtnClick(Sender: TObject);
    procedure Action3Execute(Sender: TObject);
    procedure EditPrikazBPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure EditHoursPropertiesEditValueChanged(Sender: TObject);
    procedure EditTarifPropertiesEditValueChanged(Sender: TObject);
  private
    PId_VidOpl:LongWord;
    PId_Smeta:LongWord;
    PId_Man:LongWord;
    PResault:Variant;
    PParameter:TZCurrentParameters;
    PLanguageIndex:Byte;
    PKodSetup:integer;
    DM:TDM;
    PNumDays:integer;
    PTaxTex:string;
    PIsNumDays:boolean;
    PSumClock:double;
    PIsSumClock:boolean;
    PNumClock:double;
    PIsNumClock:boolean;
    PPercent:double;
    PIsPercent:boolean;
    PIsProverka:boolean;
    PIsTaxText:Boolean;
    PSumma:double;
    pIdSession:Variant;
    pNumPredpr:integer;
    pDefaultPercent:Variant;
    pDefaultSumma:Variant;
    function CheckPochas(id_vo:Integer; isInserting:Boolean):Boolean;
  public
    constructor Create(AParameter:TZCurrentParameters);reintroduce;
    property resault:Variant read PResault;
  end;


implementation

uses Math, UPochasOrders;

{$R *.dfm}

constructor TFZCurrentControl.Create(AParameter:TZCurrentParameters);
var CurrKodSetup:Integer;
    CheckDS1:TpFIBDataSet;
begin
 inherited Create(AParameter.Owner);
 PLanguageIndex:=LanguageIndex;
//******************************************************************************
 //EditSumma.Properties.EditMask := '[-]?\d\d?\d?\d?\d?\d?\d?\d?\d?\d?\d?\d?\d? (['+ZSystemDecimalSeparator+']\d\d?)?';
//******************************************************************************
 LabelMan.Caption        := LabelMan_Caption[PLanguageIndex];
 LabelSumma.Caption      := LabelSumma_Caption[PLanguageIndex];
 LabelVidOpl.Caption     := LabelVidOpl_Caption[PLanguageIndex];
 LabelSmeta.Caption      := LabelSmeta_Caption[PLanguageIndex];
 LabelManMoving.Caption  := LabelManMoving_Caption[PLanguageIndex];
 LabelPeriod.Caption     := LabelPeriod_Caption[PLanguageIndex];
 LabelPrikaz.Caption     := LabelPrikaz_Caption[PLanguageIndex];

 SummaByHoursBtn.Caption := ByHours_Const[PLanguageIndex];
 SummaAverageBtn.Caption := Average_Const[PLanguageIndex];
 SummaPrevPeriodBtn.Caption := PrevPeriod_Const[PLanguageIndex];
 UpdateSvodsBtn.Caption  := CorrectSvod_Const[PLanguageIndex];

 MonthesList.Properties.Items.Text := MonthesList_Text[PLanguageIndex];
 YesBtn.Caption          := YesBtn_Caption[PLanguageIndex];
 YesBtn.Hint             := YesBtn.Caption;
 CancelBtn.Caption       := CancelBtn_Caption[PLanguageIndex];
 CancelBtn.Hint          := CancelBtn.Caption+' (Esc)';
//******************************************************************************
 Grid1ClDepartment.Caption := LabelDepartment_Caption[PLanguageIndex];
 Grid1ClCategory.Caption   := LabelCategory_Caption[PLanguageIndex];
 Grid1ClDateBeg.Caption    := GridClBegPeriod_Caption[PLanguageIndex];
 Grid1ClDateEnd.Caption    := GridClEndPeriod_Caption[PLanguageIndex];
 Grid1ClOklad.Caption      := 'Оклад';
//******************************************************************************
 Grid2ClPeriodBeg.Caption  := GridClBegPeriod_Caption[PLanguageIndex];
 Grid2ClPeriodEnd.Caption  := GridClEndPeriod_Caption[PLanguageIndex];
 Grid2ClNameSovmest.Caption:= GridClNameSovmest_Caption[PLanguageIndex];
//******************************************************************************
 PParameter:=AParameter;
 PResault := NULL;
 dxStatusBar1.Panels[0].Text := ToBufferBtn_Hint[PLanguageIndex];
 dxStatusBar1.Panels[1].Text := YesBtn_Hint[PLanguageIndex];
 dxStatusBar1.Panels[2].Text := CancelBtn_Hint[PLanguageIndex];
 //******************************************************************************
 PIsNumDays:=False;
 PIsSumClock:=False;
 PIsNumClock:=False;
 PIsPercent:=False;
 //******************************************************************************
 DM:=TDM.Create(self,PParameter);

 CheckDS.Database:=DM.DataBase;
 CheckDS.Transaction:=DM.DefaultTransaction;

 if PParameter.ControlFormStyle=zcfsDelete then Exit;
 //******************************************************************************
 
 if PParameter.ControlFormStyle=zcfsUpdate
 then begin
           if PParameter.ControlFormStyle=zcfsInsert
           then CheckPochas(DM.DSetAllData['ID_VIDOPL'], true);

           if PParameter.ControlFormStyle=zcfsUpdate
           then CheckPochas(DM.DSetAllData['ID_VIDOPL'], false);
 end;

 if (DM.DSetAllData.FieldByName('POCHAS_ORDER').Value>0)
 then begin
           EditPrikaz.Visible:=False;
           EditPrikazB.Visible:=True;
           EditPrikazB.Text:='Наказ від '+DM.DSetAllData.FieldByName('date_order').AsString+' № '+DM.DSetAllData.FieldByName('num_order').AsString;

           LabelSumma.Enabled :=False;
           EditSumma.Enabled  :=False;
           EditSumma.PopupMenu:=nil;

           EditTarif.Value:=DM.DSetAllData.FieldByName('SUM_CLOCK').Value;
           EditHours.Value:=DM.DSetAllData.FieldByName('CLOCK').Value;

           LabelHours.Visible :=True;
           EditHours.Visible  :=True;
           LabelTarif.Visible :=True;
           EditTarif.Visible  :=True;

           if DM.DSetAllData.FieldByName('POCHAS_ORDER').Value<>null
           then EditPrikazB.Tag:=DM.DSetAllData.FieldByName('POCHAS_ORDER').Value;
 end;

 if VarIsNull(DM.DSetAllData['NDAY']) then
  begin
   PNumDays      := 0;
   PIsNumDays    := False;
  end
 else
  begin
   PNumDays      := DM.DSetAllData['NDAY'];
   PIsNumDays    := True;
  end;

 if VarIsNull(DM.DSetAllData['CLOCK']) then
  begin
   PNumClock      := 0;
   PIsNumClock    := False;
  end
 else
  begin
   PNumClock      := DM.DSetAllData['CLOCK'];
   PIsNumClock    := True;
  end;

 if VarIsNull(DM.DSetAllData['SUM_CLOCK']) then
  begin
   PSumClock      := 0;
   PIsSumClock    := False;
  end
 else
  begin
   PSumClock      := DM.DSetAllData['SUM_CLOCK'];
   PIsSumClock    := True;
  end;

 if VarIsNull(DM.DSetAllData['PERCENT']) then
  begin
   PPercent      := 0;
   PIsPercent    := False;
  end
 else
  begin
   PPercent      := DM.DSetAllData['PERCENT'];
   PIsPercent    := True;
  end;

 if VarIsNull(DM.DSetAllData['TAX_TEXT']) then
  begin
   PTaxTex      := '';
   PIsTaxText   := False;
  end
 else
  begin
   PTaxTex      := VarToStr(DM.DSetAllData['TAX_TEXT']);
   PIsTaxText    := True;
  end;

 if VarIsNull(DM.DSetAllData['ID_MAN']) then
  begin
   PId_Man      := 0;
   EditMan.Text := '';
  end
 else
  begin
   PId_Man:=DM.DSetAllData['ID_MAN'];
   EditMan.Text := IfThen(VarIsNull(DM.DSetAllData['TN']),'',VarToStr(DM.DSetAllData['TN'])+' - '+VarToStr(DM.DSetAllData['FIO']));
  end;
//******************************************************************************
 if VarIsNull(Dm.DSetAllData['ID_SMETA']) then
  begin
   PId_Smeta:=0;
   EditSmeta.Text := '';
  end
 else
  begin
   PId_Smeta              := DM.DSetAllData['ID_SMETA'];
   EditSmeta.Text         := VarToStr(DM.DSetAllData['KOD_SMETA']);
   LabelSmetaName.Caption := VarToStr(DM.DSetAllData['NAME_SMETA']);
  end;
 if VarIsNull(DM.DSetAllData['ID_VIDOPL']) then
  begin
   PId_VidOpl:=0;
   EditVidOpl.Text := '';
  end
 else
  begin
   PId_VidOpl              := DM.DSetAllData['ID_VIDOPL'];
   EditVidOpl.Text         := VarToStr(DM.DSetAllData['KOD_VIDOPL']);
   LabelVidOplName.Caption := VarToStr(DM.DSetAllData['NAME_VIDOPL']);
  end;
 if VarIsNull(DM.DSetAllData['PRIKAZ']) then EditPrikaz.Text := ''
 else EditPrikaz.Text := varToStr(DM.DSetAllData['PRIKAZ']);

 if VarIsNull(DM.DSetAllData['KOD_SETUP']) then
  begin
    CurrKodSetup:=CurrentKodSetup(PParameter.Db_Handle);
    self.MonthesList.ItemIndex   := YearMonthFromKodSetup(CurrKodSetup,False)-1;
    self.YearSpinEdit.Value      := YearMonthFromKodSetup(CurrKodSetup);
  end
 else
  begin
    self.MonthesList.ItemIndex   := YearMonthFromKodSetup(DM.DSetAllData['KOD_SETUP'],False)-1;
    self.YearSpinEdit.Value      := YearMonthFromKodSetup(DM.DSetAllData['KOD_SETUP']);
  end;
 PIsProverka:=False;
 PSumma:=0;
 if not VarIsNull(DM.DSetAllData['SUMMA']) then
  begin
   EditSumma.Text := FloatToStrF(DM.DSetAllData['SUMMA'],ffFixed,17,2);
   PIsProverka:=True;
   PSumma := DM.DSetAllData['SUMMA'];
  end;
 CheckBoxNowPay.Checked := not (DM.DSetAllData['NOW_PAY']='T');
//******************************************************************************
 case PParameter.ControlFormStyle of
  zcfsInsert:
   begin
    Caption:=ZCurrentCtrl_Caption_Insert[PLanguageIndex];
    BoxMain.Enabled:=False;
    GridRmovingDBTableView1.DataController.DataSource := DM.DSourceRmoving;
    Grid1DBTableView1.DataController.DataSource:=DM.DSourceMoving;
    SummaAvgSmetsBtn.Visible := True;
   end;
  zcfsUpdate:
   begin
    Caption:=ZCurrentCtrl_Caption_Update[PLanguageIndex];
    BoxMain.Enabled:=False;
    GridRmovingDBTableView1.DataController.DataSource := DM.DSourceRmoving;
    GridRmovingDBTableView1.DataController.LocateByKey(DM.DSetAllData['RMOVING']);
    Grid1DBTableView1.DataController.DataSource:=DM.DSourceMoving;
    Grid1DBTableView1.DataController.LocateByKey(DM.DSetAllData['ID_MOVING']);
    SummaAvgSmetsBtn.Visible := False;
   end;
  zcfsShowDetails:
   begin
    Caption:=ZCurrentCtrl_Caption_Detail[PLanguageIndex];
    BoxChild.Enabled := False;
    BoxMain.Enabled  := False;
    IdMovingBox.Enabled:=False;
    PrikazBox.Enabled:=False;
    YesBtn.Visible :=False;
    CancelBtn.Caption := ExitBtn_Caption[PLanguageIndex];
    Grid1ClDateBeg.Visible := False;
    Grid1ClDateEnd.Visible := False;
    Grid1DBTableView1.OptionsCustomize.ColumnHorzSizing := True;
    Grid1DBTableView1.OptionsView.ColumnAutoWidth:=True;
    GridRmovingDBTableView1.DataController.DataSource := DM.DSourceRmoving;
    GridRmovingDBTableView1.DataController.LocateByKey(DM.DSetAllData['RMOVING']);
    Grid1DBTableView1.DataController.DataSource:=DM.DSourceMoving;
    Grid1DBTableView1.DataController.LocateByKey(DM.DSetAllData['ID_MOVING']);
   end;
 end;
 PKodSetup := PeriodToKodSetup(YearSpinEdit.Value,MonthesList.ItemIndex+1);
 pNumPredpr := StrToInt(VarToStrDef(ValueFieldZSetup(Dm.DataBase.Handle,'NUM_PREDPR'),'2'));
 SummaAvgSmetsBtn.Visible := pNumPredpr<>1;

 try
           CheckDS1:=TpFIBDataSet.Create(self);
           CheckDS1.Database   :=DM.DataBase;
           CheckDS1.Transaction:=DM.DefaultTransaction;
           CheckDS1.SelectSQL.Text:='select Z_POCHAS_TARIF_MAY_EDIT from Z_POCHAS_TARIF_MAY_EDIT';
           CheckDS1.Open;
           if (CheckDS1.RecordCount>0)
           then begin
                     if (CheckDS1.FieldByName('Z_POCHAS_TARIF_MAY_EDIT').Value=1)
                     then EditTarif.Enabled:=true
                     else EditTarif.Enabled:=false;
           end;
           CheckDS1.Close;
           CheckDS1.Free;
           except on e:exception do begin end;
  end;
end;

procedure TFZCurrentControl.CancelBtnClick(Sender: TObject);
begin
ModalResult  := mrCancel;
end;

procedure TFZCurrentControl.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
DM.Free;
end;

procedure TFZCurrentControl.FormCreate(Sender: TObject);
begin
CheckDS.Database   :=DM.DataBase;
CheckDS.Transaction:=DM.DefaultTransaction;
FormResize(Sender);
If PParameter.ControlFormStyle=zcfsDelete then
 begin
  if ZShowMessage(ZCurrentCtrl_Caption_Delete[PLanguageIndex],
                   DeleteRecordQuestion_Text[PLanguageIndex],mtConfirmation,[mbYes,mbNo])=mrYes then
   with DM do
   try
    DataBase.Handle := PParameter.Db_Handle;
    StoredProc.Database := DataBase;
    StoredProc.Transaction := WriteTransaction;
    StoredProc.Transaction.StartTransaction;
    StoredProc.StoredProcName := 'Z_CURRENT_D';
    StoredProc.Prepare;
    StoredProc.ParamByName('ID_CURRENT').AsInteger    := PParameter.ID;
    StoredProc.ExecProc;
    StoredProc.Transaction.Commit;
    ModalResult:=mrYes;
   except
    on E:Exception do
     begin
      ZShowMessage(Error_Caption[PLanguageIndex],E.Message,mtError,[mbOK]);
      WriteTransaction.Rollback;
     end;
   end
  else
   ModalResult:=mrCancel;
 end;
end;

procedure TFZCurrentControl.Action1Execute(Sender: TObject);
var CheckSP:TpFIBStoredProc;
    ExitFlag:Boolean;
begin
      if EditPrikazB.Visible and (EditPrikazB.Tag=0)
      then begin
                if CheckDS.RecordCount>0
                then begin
                          if CheckDS.FieldByName('need_order').Value=1
                          then begin
                                    ShowMessage('Не вибрано наказ для погодинної оплати праці!');
                                    EditPrikazB.SetFocus;
                                    Exit;
                          end;
                end;
      end;


      if DM.DSetMoving.IsEmpty
      then begin
                ZShowMessage(ZeInputError_Caption[PLanguageIndex],ZeManMoving_NotAvailable_Text[PLanguageIndex],mtInformation,[mbOK]);
                CancelBtn.SetFocus;
                Exit;
      end;

      if EditMan.Text=''
      then begin
                ZShowMessage(ZeInputError_Caption[PLanguageIndex],ManInput_ErrorText[PLanguageIndex],mtInformation,[mbOK]);
                EditMan.SetFocus;
                Exit;
      end;

      if EditSumma.Text=''
      then begin
                ZShowMessage(ZeInputError_Caption[PLanguageIndex],SummaInput_ErrorText[PLanguageIndex],mtInformation,[mbOK]);
                EditSumma.SetFocus;
                Exit;
      end;
      
      if PId_VidOpl=0
      then begin
                ZShowMessage(ZeInputError_Caption[PLanguageIndex],VidOplInput_ErrorText[PLanguageIndex],mtInformation,[mbOK]);
                EditVidOpl.SetFocus;
                Exit;
      end;

      if PId_Smeta=0
      then begin
                ZShowMessage(ZeInputError_Caption[PLanguageIndex],SmetaInput_ErrorText[PLanguageIndex],mtInformation,[mbOK]);
                EditSmeta.SetFocus;
                Exit;
      end;


      if EditPrikazB.Visible 
      then begin
                CheckSP:=TpFIBStoredProc.Create(self);
                CheckSP.Database:=DM.DataBase;
                CheckSP.Transaction:=DM.DefaultTransaction;
                CheckSP.StoredProcName:='Z_POCHAS_CHECK';
                CheckSP.Prepare;

                case PParameter.ControlFormStyle of
                zcfsInsert: CheckSP.ParamByName('id_current').Value    :=0;
                zcfsUpdate: CheckSP.ParamByName('id_current').Value    :=DM.DSetAllData['ID_CURRENT'];
                end;

                CheckSP.ParamByName('id_pochas_plan').Value:=EditPrikazB.Tag;
                CheckSP.ParamByName('id_vo').AsInt64       :=PId_VidOpl;
                CheckSP.ParamByName('hours').Value         :=PNumClock;
                CheckSP.ParamByName('kod_setup').Value     :=PKodSetup;
                CheckSP.ParamByName('id_man').Value        :=DM.DSetAllData['ID_MAN'];

                CheckSP.ExecProc;

                ExitFlag:=false;
                if CheckSP.ParamByName('result').Value=0
                then begin
                          ZShowMessage(ZeInputError_Caption[PLanguageIndex], CheckSP.ParamByName('error_msg').AsString ,mtInformation,[mbOK]);
                          ExitFlag:=true;
                end;

                CheckSP.Free;

                if ExitFlag then Exit;
      end;
      

      case PParameter.ControlFormStyle
      of
          zcfsInsert:
          with DM do
          try
                    StoredProc.Database := DataBase;
                    StoredProc.Transaction := WriteTransaction;
                    StoredProc.Transaction.StartTransaction;
                    StoredProc.StoredProcName := 'Z_CURRENT_INSERT';
                    StoredProc.Prepare;
                    StoredProc.ParamByName('KOD_SETUP').AsInteger     := PeriodToKodSetup(YearSpinEdit.Value,MonthesList.ItemIndex+1);
                    StoredProc.ParamByName('KOD_SETUP_O1').AsInteger  := PeriodToKodSetup(YearSpinEdit.Value,MonthesList.ItemIndex+1);
                    StoredProc.ParamByName('KOD_SETUP_O2').AsInteger  := PeriodToKodSetup(YearSpinEdit.Value,MonthesList.ItemIndex+1);
                    if not VarIsNull(DSetAllData['ID_MAN']) then StoredProc.ParamByName('ID_MAN').AsInteger       := DSetAllData.FieldValues['ID_MAN'];
                    if not VarIsNull(DSetAllData['TN'])     then StoredProc.ParamByName('TN').AsInteger           := DSetAllData.FieldValues['TN'];
                    StoredProc.ParamByName('ID_VIDOPL').AsInteger     := PId_VidOpl;
                    StoredProc.ParamByName('ID_DEPARTMENT').AsVariant := DSetMoving['ID_DEPARTMENT'];
                    StoredProc.ParamByName('ID_CATEGORY').AsVariant   := DSetMoving['ID_CATEGORY'];
                    StoredProc.ParamByName('ID_MOVING').AsVariant     := DSetMoving['ID_MOVING'];
                    StoredProc.ParamByName('RMOVING').AsInteger       := DSetRmoving['RMOVING'];
                    StoredProc.ParamByName('SUMMA').AsFloat           := StrToFloat(EditSumma.Text);
                    StoredProc.ParamByName('KOD_SMET').AsInteger      := PId_Smeta;
                    StoredProc.ParamByName('DATE_REG').AsDate         := Date;

                    if EditPrikaz.Visible
                    then begin
                              StoredProc.ParamByName('PRIKAZ').AsString         := EditPrikaz.Text;
                    end
                    else begin
                              StoredProc.ParamByName('PRIKAZ').AsString         := EditPrikazB.Text;
                    end;

                    StoredProc.ParamByName('P_OLD').AsString          := 'F';
                    StoredProc.ParamByName('ID_SESSION').AsVariant    := pIdSession;

                    if EditPrikazB.Visible
                    then if EditPrikazB.Tag>0 then StoredProc.ParamByName('POCHAS_ORDER').AsInt64    := EditPrikazB.Tag
                                              else StoredProc.ParamByName('POCHAS_ORDER').Value      := null
                    else StoredProc.ParamByName('POCHAS_ORDER').Value      := null;

                    if CheckBoxNowPay.Checked then StoredProc.ParamByName('NOW_PAY').AsString := 'F'
                                              else StoredProc.ParamByName('NOW_PAY').AsString := 'T';

                    if (PSumma<>StrToFloat(EditSumma.Text)) and (PIsProverka)
                    then begin
                              StoredProc.ParamByName('NDAY').AsVariant      := Null;
                              StoredProc.ParamByName('PERCENT').AsVariant   := Null;
                              StoredProc.ParamByName('SUM_CLOCK').AsVariant := Null;
                              StoredProc.ParamByName('CLOCK').AsVariant     := Null;
                              StoredProc.ParamByName('TAX_TEXT').AsVariant  := Null;
                    end
                    else begin
                              if EditPrikazB.Visible
                              then begin
                                        StoredProc.ParamByName('PERCENT').AsVariant   := 100;
                                        StoredProc.ParamByName('NDAY').AsVariant      := Null;
                                        StoredProc.ParamByName('CLOCK').AsDouble      :=EditHours.Value;
                                        StoredProc.ParamByName('SUM_CLOCK').AsDouble  :=EditTarif.Value;
                                        StoredProc.ParamByName('TAX_TEXT').AsVariant  := Null;
                              end
                              else begin
                                        if PIsNumDays then StoredProc.ParamByName('NDAY').AsInteger        := PNumDays
                                                      else StoredProc.ParamByName('NDAY').AsVariant      := Null;

                                        if PIsPercent then StoredProc.ParamByName('PERCENT').AsDouble      := PPercent
                                                      else StoredProc.ParamByName('PERCENT').AsVariant   := Null;

                                        if PIsSumClock then StoredProc.ParamByName('SUM_CLOCK').AsDouble    := PSumClock
                                                       else StoredProc.ParamByName('SUM_CLOCK').AsVariant := Null;

                                        if PIsNumClock then StoredProc.ParamByName('CLOCK').AsDouble        := PNumClock
                                                       else StoredProc.ParamByName('CLOCK').AsVariant     := Null;

                                        if PIsTaxText then StoredProc.ParamByName('TAX_TEXT').AsString     := PTaxTex
                                                      else StoredProc.ParamByName('TAX_TEXT').AsVariant  := Null;
                              end;
                    end;

                    StoredProc.ExecProc;
                    PResault := StoredProc.ParamByName('ID_CURRENT').AsInteger;
                    StoredProc.Transaction.Commit;
                    ModalResult := mrYes;
          except
          on E:Exception do
             begin
                  ZShowMessage(Error_caption[PLanguageIndex],E.Message,mtError,[mbOK]);
                  WriteTransaction.Rollback;
             end;
          end;

          zcfsUpdate:
          with DM do
                     try
                         StoredProc.Database := DataBase;
                         StoredProc.Transaction := WriteTransaction;
                         StoredProc.Transaction.StartTransaction;
                         StoredProc.StoredProcName := 'Z_CURRENT_UPDATE';
                         StoredProc.Prepare;
                         StoredProc.ParamByName('ID_CURRENT').AsInteger    := DSetAllData['ID_CURRENT'];
                         StoredProc.ParamByName('KOD_SETUP').AsInteger     := PeriodToKodSetup(YearSpinEdit.Value,MonthesList.ItemIndex+1);
                         StoredProc.ParamByName('KOD_SETUP_O1').AsInteger  := PeriodToKodSetup(YearSpinEdit.Value,MonthesList.ItemIndex+1);
                         StoredProc.ParamByName('KOD_SETUP_O2').AsInteger  := PeriodToKodSetup(YearSpinEdit.Value,MonthesList.ItemIndex+1);

                         if not VarIsNull(DSetAllData['ID_MAN']) then StoredProc.ParamByName('ID_MAN').AsInteger       := DSetAllData.FieldValues['ID_MAN'];
                         if not VarIsNull(DSetAllData['TN']) then StoredProc.ParamByName('TN').AsInteger           := DSetAllData.FieldValues['TN'];
                         StoredProc.ParamByName('ID_VIDOPL').AsInteger     := PId_VidOpl;
                         StoredProc.ParamByName('ID_DEPARTMENT').AsVariant := DSetMoving['ID_DEPARTMENT'];
                         StoredProc.ParamByName('ID_CATEGORY').AsVariant   := DSetMoving['ID_CATEGORY'];
                         StoredProc.ParamByName('ID_MOVING').AsVariant     := DSetMoving['ID_MOVING'];
                         if not VarIsNull(DSetAllData['RMOVING']) then StoredProc.ParamByName('RMOVING').AsInteger      := DSetRmoving['RMOVING'];

                         StoredProc.ParamByName('SUMMA').AsFloat           := StrToFloat(EditSumma.Text);
                         StoredProc.ParamByName('KOD_SMET').AsInteger      := PId_Smeta;
                         StoredProc.ParamByName('DATE_REG').AsDate         := Date;

                         if EditPrikaz.Visible then StoredProc.ParamByName('PRIKAZ').AsString         := EditPrikaz.Text
                                               else StoredProc.ParamByName('PRIKAZ').AsString         := EditPrikazB.Text;

                         if EditPrikazB.Visible then if EditPrikazB.Tag>0 then StoredProc.ParamByName('POCHAS_ORDER').AsInt64    := EditPrikazB.Tag
                                                                          else StoredProc.ParamByName('POCHAS_ORDER').Value      := null
                                                else StoredProc.ParamByName('POCHAS_ORDER').Value      := null;

                         StoredProc.ParamByName('P_OLD').AsString          := 'F';
                         if CheckBoxNowPay.Checked then StoredProc.ParamByName('NOW_PAY').AsString := 'F'
                                                   else StoredProc.ParamByName('NOW_PAY').AsString := 'T';

                         if EditPrikazB.Visible
                         then begin
                                   StoredProc.ParamByName('PERCENT').AsVariant   := 100;
                                   StoredProc.ParamByName('NDAY').AsVariant      := Null;
                                   StoredProc.ParamByName('CLOCK').AsDouble      :=EditHours.Value;
                                   StoredProc.ParamByName('SUM_CLOCK').AsDouble  :=EditTarif.Value;
                                   StoredProc.ParamByName('TAX_TEXT').AsVariant  := Null;
                         end
                         else begin
                                   if PIsNumDays then StoredProc.ParamByName('NDAY').AsInteger      := PNumDays
                                                 else StoredProc.ParamByName('NDAY').AsVariant      := Null;

                                   if PIsPercent then StoredProc.ParamByName('PERCENT').AsDouble      := PPercent
                                                 else StoredProc.ParamByName('PERCENT').AsVariant   := Null;

                                   if PIsSumClock then StoredProc.ParamByName('SUM_CLOCK').AsDouble    := PSumClock
                                                  else StoredProc.ParamByName('SUM_CLOCK').AsVariant := Null;

                                   if PIsNumClock then StoredProc.ParamByName('CLOCK').AsDouble        := PNumClock
                                                  else StoredProc.ParamByName('CLOCK').AsVariant     := Null;

                                   if PIsTaxText then StoredProc.ParamByName('TAX_TEXT').AsString     := PTaxTex
                                                 else StoredProc.ParamByName('TAX_TEXT').AsVariant  := Null;
                         end;

                         StoredProc.ExecProc;
                         StoredProc.Transaction.Commit;
                         ModalResult := mrYes;
                     except
                                  on E:Exception do
                                  begin
                                        ZShowMessage(Error_caption[PlanguageIndex],E.Message,mtError,[mbOK]);
                                        WriteTransaction.Rollback;
                                  end;
                     end;
      end;
end;

procedure TFZCurrentControl.EditVidOplExit(Sender: TObject);
var Vo:variant;
begin
 if EditVidOpl.Text<>'' then
  begin
   VO:=VoByKod(StrToInt(EditVidOpl.Text),Date,DM.DataBase.Handle,ZCurrentVidOplProp);
   if not VarIsNull(VO) then
    begin
     PId_VidOpl:=VO[0];
     LabelVidOplName.Caption:=VarToStr(VO[2]);
     //Проверяем является ли выбранный вид оплат "почасовкой"
      if PParameter.ControlFormStyle=zcfsInsert

      then CheckPochas(VO[0], true);

      if PParameter.ControlFormStyle=zcfsUpdate
      then CheckPochas(VO[0], false); 

    end
   else
    EditVidOpl.SetFocus;
  end;
end;

procedure TFZCurrentControl.EditSmetaExit(Sender: TObject);
var Smeta:variant;
begin
 if EditSmeta.Text<>'' then
  begin
   Smeta:=SmetaByKod(StrToInt(EditSmeta.Text),DM.DataBase.Handle);
   if not VarIsNull(Smeta) then
    begin
     PId_Smeta:=Smeta[0];
     LabelSmetaName.Caption:=VarToStr(Smeta[2]);
    end
   else
    EditSmeta.SetFocus;
  end
end;

procedure TFZCurrentControl.Grid1ClDepartmentGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
AText:=Grid1DBTableView1.DataController.DataSource.DataSet['KOD_DEPARTMENT']+' - '+AText;
end;

procedure TFZCurrentControl.MonthesListExit(Sender: TObject);
var UpdateTarifDS:TpFIBDataSet;
begin
if PKodSetup=PeriodToKodSetup(YearSpinEdit.Value,MonthesList.ItemIndex+1) then Exit
else PKodSetup:=PeriodToKodSetup(YearSpinEdit.Value,MonthesList.ItemIndex+1);
if DM.DSetMoving.Active then DM.DSetMoving.Close;
if DM.DSetRmoving.Active then DM.DSetRMoving.Close;




case PParameter.ControlFormStyle of
 zcfsInsert:
  begin
   DM.DSetRmoving.SQLs.SelectSQL.Text := 'SELECT * FROM Z_GET_RMOVINGS('+
                                                 IntToStr(PParameter.ID)+','+
                                                 IntToStr(PKodSetup)+') order by date_end descending';
   DM.DSetMoving.SQLs.SelectSQL.Text  := 'SELECT * FROM Z_MAN_MOVINGS_BY_R(?RMOVING,'+
                                                 IntToStr(PKodSetup)+
                                                 ') ORDER BY DATE_END';
   DM.DSetRmoving.Open;
   DM.DSetMoving.Open;

      if  EditPrikazB.Tag>0
      then begin
          UpdateTarifDS:=TpFIBDataSet.Create(self);
          UpdateTarifDS.Database:=DM.DataBase;
          UpdateTarifDS.Transaction:=DM.DefaultTransaction;
          UpdateTarifDS.SelectSQL.Text:='SELECT * FROM Z_POCHAS_GET_TARIF('+IntTostr(EditPrikazB.Tag)+','+iNTTOSTR(PKodSetup)+')';

          UpdateTarifDS.Open;
          if (UpdateTarifDS.RecordCount>0)
          then begin
                       EditTarif.Value:=UpdateTarifDS.Fieldbyname('tarif').Value;

          end;
          UpdateTarifDS.Close;
          UpdateTarifDS.Free;
       end;





  end;
 zcfsUpdate:
  begin
   DM.DSetRmoving.SQLs.SelectSQL.Text := 'SELECT * FROM Z_GET_RMOVINGS('+
                                                 VarToStr(DM.DSetAllData['ID_MAN'])+','+
                                                 IntToStr(PKodSetup)+') order by date_end descending';
   DM.DSetMoving.SQLs.SelectSQL.Text:='SELECT * FROM Z_MAN_MOVINGS_BY_R(?RMOVING,'+
                                      IntToStr(PKodSetup)+
                                      ') ORDER BY DATE_END';
   DM.DSetRmoving.Open;
   DM.DSetMoving.Open;

      if  DM.DSetAllData.FieldByName('POCHAS_ORDER').Value>0
      then begin
          UpdateTarifDS:=TpFIBDataSet.Create(self);
          UpdateTarifDS.Database:=DM.DataBase;
          UpdateTarifDS.Transaction:=DM.DefaultTransaction;
          UpdateTarifDS.SelectSQL.Text:='SELECT * FROM Z_POCHAS_GET_TARIF('+DM.DSetAllData.FieldByName('POCHAS_ORDER').AsString+','+iNTTOSTR(PKodSetup)+')';

          UpdateTarifDS.Open;
          if (UpdateTarifDS.RecordCount>0)
          then begin
                    if UpdateTarifDS.Fieldbyname('tarif').Value<>null
                    then EditTarif.Value:=UpdateTarifDS.Fieldbyname('tarif').Value
                    else EditTarif.Value:=0;

          end;
          UpdateTarifDS.Close;
          UpdateTarifDS.Free;
       end;



  end;



 else
  Exit;
end;
end;

procedure TFZCurrentControl.EditSmetaPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var Smeta:Variant;
begin
Smeta:=GetSmets(self,PParameter.Db_Handle,Date,psmSmet);
if VarArrayDimCount(Smeta)> 0 then
 If Smeta[0]<>NULL then
  begin
   EditSmeta.Text         := Smeta[3];
   LabelSmetaName.Caption := Smeta[2];
   PId_Smeta              := Smeta[0];
  end;
end;

procedure TFZCurrentControl.EditVidOplPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var VidOpl:Variant;
begin
     VidOPl:=LoadVidOpl(self,
                        PParameter.Db_Handle,zfsModal,
                        ValueFieldZSetup(PParameter.Db_Handle,'ID_VO_PROP_CURRENT'),
                        ValueFieldZSetup(PParameter.Db_Handle,'Z_ID_SYSTEM'));

     if VarArrayDimCount(VidOpl)> 0
     then begin
               if VidOpl[0]<> NULL
               then begin
                         EditVidOpl.Text         := VidOpl[2];
                         LabelVidOplName.Caption := VidOpl[1];
                         PId_VidOpl              := VidOpl[0];

                         //Проверяем является ли выбранный вид оплат "почасовкой"
                         if PParameter.ControlFormStyle=zcfsInsert
                         then CheckPochas(VidOpl[0], true);

                         if PParameter.ControlFormStyle=zcfsUpdate
                         then CheckPochas(VidOpl[0], false);   

               end;
     end;
end;

procedure TFZCurrentControl.RestoreFromBuffer(Sender:TObject);
var reg:TRegistry;
    Kod:integer;
begin
  reg := TRegistry.Create;
  reg.RootKey:=HKEY_CURRENT_USER;
  if not reg.OpenKey('\Software\Zarplata\CurrentCtrl\',False) then
   begin
    reg.free;
    Exit;
   end;

 try
  kod := reg.ReadInteger('IsBuffer');
  if kod<=0 then
   begin
    reg.Free;
    Exit;
   end;
 except
  reg.Free;
  exit;
 end;

 try
  Kod := reg.ReadInteger('KodSmeta');
  if Kod>0 then
   begin
    EditSmeta.Text := IntToStr(Kod);
    EditSmetaExit(sender);
   end;
 except
  Kod:=0;
 end;

 try
  Kod := reg.ReadInteger('KodVidOpl');
  if Kod>0 then
   begin
    EditVidOpl.Text := IntToStr(Kod);
    EditVidOplExit(sender);
   end;
 except
  Kod:=0;
 end;

 try
  EditPrikaz.Text := reg.ReadString('Prikaz');
 except
  EditPrikaz.Text := '';
 end;

 try
  Kod := reg.ReadInteger('KodSetup');
  if Kod>0 then
   begin
    MonthesList.ItemIndex := YearMonthFromKodSetup(Kod,False)-1;
    YearSpinEdit.Value := YearMonthFromKodSetup(Kod);
   end;
 except
  Kod:=0;
 end;

 try
  Kod := reg.ReadInteger('NOW_PAY');
  if Kod>0 then CheckBoxNowPay.Checked := (Kod=0);
 except
  Kod:=0;
 end;

 editSumma.SetFocus;
 Reg.Free;
end;

procedure TFZCurrentControl.Action2Execute(Sender: TObject);
var reg: TRegistry;
begin
 reg:=TRegistry.Create;
 try
  reg.RootKey:=HKEY_CURRENT_USER;
  reg.OpenKey('\Software\Zarplata\CurrentCtrl\',True);
  reg.WriteInteger('IsBuffer',1);
  reg.WriteInteger('KodSmeta',StrToInt(EditSmeta.Text));
  reg.WriteInteger('KodVidOpl',StrToInt(EditVidOpl.Text));
  reg.WriteInteger('KodSetup',PeriodToKodSetup(YearSpinEdit.Value,MonthesList.ItemIndex+1));
  reg.WriteString('Prikaz',EditPrikaz.Text);
  if CheckBoxNowPay.Checked then reg.WriteInteger('NOW_PAY',0)
                            else reg.WriteInteger('NOW_PAY',1);
 finally
  reg.Free;
 end;
end;

procedure TFZCurrentControl.FormShow(Sender: TObject);
var KodSmeta:variant;
begin
if PParameter.ControlFormStyle=zcfsInsert then
 begin
    KodSmeta := ValueFieldZSetup(DM.DataBase.Handle,'Z_DEFAULT_KOD_SM');
    if not VarIsNull(KodSmeta) then
     begin
      EditSmeta.Text := VarToStr(KodSmeta);
      EditSmetaExit(self);
      EditVidOpl.SetFocus;
     end;
    RestoreFromBuffer(self);
 end;
end;

procedure TFZCurrentControl.SummaByHoursBtnClick(Sender: TObject);
var Res:TFByHours_Result;
    defOrder, InfoDS:TpFIBDataSet;
    FS:TFormatSettings;

begin
//Проверяем является ли выбранный вид оплат "почасовкой"
     if PParameter.ControlFormStyle=zcfsInsert
         then CheckPochas(PId_VidOpl, true);

     if PParameter.ControlFormStyle=zcfsUpdate
         then CheckPochas(PId_VidOpl, false); 

     If PParameter.ControlFormStyle=zcfsUpdate
     then begin
               InfoDS:=TpFIBDataSet.Create(self);
               InfoDS.Database:=DM.DataBase;
               InfoDS.Transaction:=DM.DefaultTransaction;
               InfoDS.SelectSQL.Text:='SELECT * FROM Z_CURRENT WHERE ID_CURRENT='+IntToStr(PParameter.ID);
               InfoDS.Open;
               if InfoDS.RecordCount>0
               then begin
                         if InfoDS.FieldByName('clock').Value<>null
                         then PSumClock:=InfoDS.FieldByName('clock').Value;
                         if InfoDS.FieldByName('percent').Value<>null
                         then PPercent :=InfoDS.FieldByName('percent').Value;
                         if InfoDS.FieldByName('sum_clock').Value<>null
                         then PSumma   :=InfoDS.FieldByName('sum_clock').Value;
               end;
               InfoDS.Close;
               InfoDS.Free;
               Res:=SumForHours(self,DM.DataBase.Handle,DM.DSetMoving['ID_MOVING'],pDefaultPercent,pDefaultSumma,PPercent,PSumClock,PSumma);
               PSumClock:=0;
               PPercent :=0;
               PSumma   :=0;

     end
     else Res:=SumForHours(self,DM.DataBase.Handle,DM.DSetMoving['ID_MOVING'],pDefaultPercent,pDefaultSumma,pDefaultPercent,null,null);


     if Res.ModalResult=mrYes
     then begin
               PIsProverka:=False;
               PIsNumDays:=False;
               PIsSumClock:=False;
               PIsNumClock:=False;
               PIsPercent:=False;
               PIsTaxText:=False;
               pIdSession:=null;

               if Trim(res.Clock)='' then PNumClock:=0
                                     else PNumClock:=StrToFloat(Res.Clock);
               PSumClock:=Res.Sum_Clock;
               PPercent:=Res.Percent;
               PIsNumClock:=True;
               PIsSumClock:=True;
               PIsPercent:=True;
               EditSumma.Text:=FloatToStrF(res.Summa,ffFixed,17,2);
               EditSmeta.Enabled := True;

               if CheckDS.Active
               then begin
                         if CheckDS.RecordCount>0
                         then begin
                                   if CheckDS.FieldByName('need_order').Value=1
                                   then begin
                                             //Подтягиваем приказ по умолчанию если таковой найдется
                                             defOrder:=TpFIBDataSet.Create(self);
                                             defOrder.Database:=DM.DataBase;
                                             defOrder.Transaction:=DM.DefaultTransaction;
                                             FS.DecimalSeparator:='.';
                                             defOrder.SelectSQL.Text:=' SELECT * FROM Z_POCHAS_GET_ORDERS_BY_PC('+IntToStr(PKodSetup)+','+VarToStr(DM.DSetAllData['ID_MAN'])+') where rest>='+FloatToStr(PNumClock,FS);
                                             defOrder.Open;
                                             if (defOrder.RecordCount>0)
                                             then begin
                                                       EditPrikazB.Text:='Наказ від '+defOrder.FieldByName('date_order').AsString+' № '+defOrder.FieldByName('num_order').AsString;
                                                       EditPrikazB.Tag :=defOrder.FieldByName('id_pochas_plan').Value;
                                             end;
                                             defOrder.Close;
                                             defOrder.Free;
                                   end;
                         end;
               end;
     end;
end;

procedure TFZCurrentControl.SummaAverageBtnClick(Sender: TObject);
var Res:TFAvgDays_Result;
begin
Res:=SumForAvg(self,DM.DataBase.Handle,DM.DSetRmoving['RMOVING'],PeriodToKodSetup(YearSpinEdit.Value,MonthesList.ItemIndex+1),PNumDays);
if Res.ModalResult=mrYes then
 begin
  PIsProverka:=False;
  PIsNumDays:=False;
  PIsSumClock:=False;
  PIsNumClock:=False;
  PIsPercent:=False;
  PIsTaxText:=False;
  pIdSession:=null;
  EditSmeta.Enabled := True;

  PNumDays:=Res.NumDays;
  PIsNumDays:=True;
  EditSumma.Text:=FloatToStrF(Res.Summa,ffFixed,17,2);
 end;
end;

procedure TFZCurrentControl.SummaPopupMenuPopup(Sender: TObject);
begin
if VarIsNULL(DM.DSetMoving['ID_MOVING']) then
 begin
  SummaByHoursBtn.Enabled := False;
  SummaAvgSmetsBtn.Enabled := False;
  SummaAverageBtn.Enabled := False;
  SummaPrevPeriodBtn.Enabled := False;
  UpdateSvodsBtn.Enabled := False;
 end
else
 begin
  SummaByHoursBtn.Enabled := True;
  SummaAvgSmetsBtn.Enabled := True;
  SummaAverageBtn.Enabled := True;
  SummaPrevPeriodBtn.Enabled := True;
  UpdateSvodsBtn.Enabled := PId_VidOpl>0;
 end;
end;

procedure TFZCurrentControl.SummaPrevPeriodBtnClick(Sender: TObject);
var Res:TFPrev_Result;
begin
Res:=SumForPrevPeriod(self,DM.DataBase.Handle,DM.DSetAllData['ID_MAN'],PeriodToKodSetup(YearSpinEdit.Value,MonthesList.ItemIndex+1)-1,DM.DSetAllData['PERCENT']);
if Res.ModalResult=mrYes then
 begin
  PIsProverka:=False;
  PIsNumDays:=False;
  PIsSumClock:=False;
  PIsNumClock:=False;
  PIsPercent:=False;
  PIsTaxText:=False;
  pIdSession:=null;

  PPercent:=Res.Percent;
  PIsPercent:=True;
  EditSumma.Text:=FloatToStrF(Res.Summa,ffFixed,17,2);
  EditSmeta.Enabled := True;
 end;
end;

procedure TFZCurrentControl.FormResize(Sender: TObject);
var i:integer;
begin
for i:=0 to dxStatusBar1.Panels.Count-1 do
    dxStatusBar1.Panels[i].Width := Width div dxStatusBar1.Panels.Count;
end;

procedure TFZCurrentControl.UpdateSvodsBtnClick(Sender: TObject);
var TaxText:Variant;
begin
 TaxText:=LoadTaxesForCurrent(Self,DM.DataBase.Handle,PId_VidOpl,PeriodToKodSetup(YearSpinEdit.Value,MonthesList.ItemIndex+1));
 if not VarIsNull(TaxText)
 then begin
           PTaxTex:=TaxText;
           PIsNumDays:=false;
           PIsSumClock:=False;
           PIsNumClock:=False;
           PIsPercent:=False;
           PIsProverka:=False;
           PIsTaxText:=True;
           pIdSession:=null;
           EditSmeta.Enabled := True;
  end;
end;

procedure TFZCurrentControl.SummaAvgSmetsBtnClick(Sender: TObject);
var Res:TFAvgDaysSm_Result;
begin
Res:=SumForAvgSmets(self,DM.DataBase.Handle,DM.DSetRmoving['RMOVING'],PeriodToKodSetup(YearSpinEdit.Value,MonthesList.ItemIndex+1),PNumDays);
if Res.ModalResult=mrYes then
 begin
  PIsProverka:=False;
  PIsNumDays:=False;
  PIsSumClock:=False;
  PIsNumClock:=False;
  PIsPercent:=False;
  PIsTaxText:=False;

  pIdSession := Res.IdSession;
  PNumDays:=Res.NumDays;
  PIsNumDays:=True;
  EditSumma.Text:=FloatToStrF(Res.Summa,ffFixed,17,2);

  EditSmeta.Text := '';
  LabelSmeta.Caption := '';
  EditSmeta.Enabled := False;
 end;
end;

procedure TFZCurrentControl.Action3Execute(Sender: TObject);
begin
     SendKeyDown(Self.ActiveControl,VK_TAB,[]);
end;

procedure TFZCurrentControl.EditPrikazBPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
    T:TfrmPochasOrders;
begin
     T:=TfrmPochasOrders.Create(self, DM.DataBase.Handle, DM.DSetAllData['ID_MAN'], PKodSetup);
     if T.ShowModal=mrYes
     then begin
               EditPrikazB.Text:='Наказ від '+T.OrdersDataSet.FieldByName('date_order').AsString+' № '+T.OrdersDataSet.FieldByName('num_order').AsString;
               EditPrikazB.Tag :=T.OrdersDataSet.FieldByName('id_pochas_plan').Value;
               EditTarif.Text:=T.OrdersDataSet.FieldByName('tarif').Value;
     end;
     T.Free;
end;

function TFZCurrentControl.CheckPochas(id_vo: Integer; isInserting:Boolean): Boolean;
var DefDS:TpFIBDataSet;
    rmoving:Integer;
begin
     if CheckDS.Active then CheckDS.Close;
     CheckDS.SelectSQL.Text:=' SELECT * FROM Z_POCHAS_GET_VO WHERE ID_VIDOPL='+IntToStr(id_vo);
     CheckDS.Open;
     CheckDS.FetchAll;
     if CheckDS.RecordCount>0
     then begin
               if (CheckDS.FieldByName('NEED_ORDER').Value=1)
               then begin
                         EditPrikaz.Visible:=false;
                         EditPrikazB.Visible:=true;

                         LabelSumma.Enabled :=False;
                         EditSumma.Enabled  :=False;
                         EditSumma.PopupMenu:=nil;

                         LabelHours.Visible :=True;
                         EditHours.Visible  :=True;
                         LabelTarif.Visible :=True;
                         EditTarif.Visible  :=True;
               end
               else begin
                         EditPrikaz.Visible :=true;
                         EditPrikazB.Visible:=false;

                         LabelSumma.Enabled :=true;
                         EditSumma.Enabled  :=true;
                         EditSumma.PopupMenu:=SummaPopupMenu;

                         LabelHours.Visible :=false;
                         EditHours.Visible  :=false;
                         LabelTarif.Visible :=false;
                         EditTarif.Visible  :=false;

                         PIsNumClock:=false;
                         PIsSumClock:=false;
               end;
     end
     else begin
               EditPrikaz.Visible:=true;
               EditPrikazB.Visible:=false;

               LabelSumma.Enabled :=true;
               EditSumma.Enabled  :=true;
               EditSumma.PopupMenu:=SummaPopupMenu;

               LabelHours.Visible :=false;
               EditHours.Visible  :=false;
               LabelTarif.Visible :=false;
               EditTarif.Visible  :=false;

               PIsNumClock:=false;
               PIsSumClock:=false;
     end;

     if (DM.DSourceRmoving.DataSet.RecordCount>0)
     then begin
               rmoving:=DM.DSourceRmoving.DataSet['RMOVING'];
     end
     else begin
               rmoving:=-1;
     end;

     DefDS:=TpFIBDataSet.Create(self);
     DefDS.Database:=DM.DataBase;
     DefDS.Transaction:=DM.DefaultTransaction;
     if not isInserting
     then begin
               DefDS.SelectSQL.Text:=' SELECT * FROM Z_GET_VO_DEF_PERC('+IntToStr(id_vo)+','+
                           DM.DSetAllData.FieldByName('KOD_SETUP').asString+','+
                           IntToStr(rmoving)+')';
     end
     else begin
               DefDS.SelectSQL.Text:=' SELECT * FROM Z_GET_VO_DEF_PERC('+IntToStr(id_vo)+','+
                           IntToStr(PeriodToKodSetup(YearSpinEdit.Value,MonthesList.ItemIndex+1))+','+
                           IntToStr(rmoving)+')';
     end;

     DefDS.Open;

     if (DefDS.RecordCount>0)
     then begin
               pDefaultPercent:=DefDS.FieldByName('percent').Value;
               pDefaultSumma  :=DefDS.FieldByName('summa').Value;
     end
     else begin
               pDefaultPercent:=null;
               pDefaultSumma  :=null;
     end;
     DefDS.Close;
     DefDS.Free;
end;


procedure TFZCurrentControl.EditHoursPropertiesEditValueChanged(
  Sender: TObject);
begin
      try
          EditSumma.Value:=RoundTo(EditHours.Value*EditTarif.Value,-2);
      except on E:Exception do
             begin

             end;
      end;
end;

procedure TFZCurrentControl.EditTarifPropertiesEditValueChanged(
  Sender: TObject);
begin
      try
          EditSumma.Value:=RoundTo(EditHours.Value*EditTarif.Value,-2);
      except on E:Exception do
             begin

             end;
      end;

end;

end.
