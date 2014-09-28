unit uISPIT_VEDOM_ABIT_ADD;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, FIBDataSet, pFIBDataSet, dxBar, dxBarExtItems,
  ActnList, ImgList, cxLabel, cxDBLookupComboBox, cxMaskEdit, FIBQuery,
  pFIBQuery, pFIBStoredProc;

type
  TFormISPIT_VEDOM_ABIT_ADD = class(TForm)
    ImageListAbitAddInVedom: TImageList;
    ActionListIAbitAddInVedom: TActionList;
    ActionObnov: TAction;
    ActionVibrat: TAction;
    ActionOtmena: TAction;
    dxBarManagerAbitAddInVedom: TdxBarManager;
    dxBarLargeButtonVibrat: TdxBarLargeButton;
    dxBarLargeButtonObnov: TdxBarLargeButton;
    dxBarLargeButtonOtmena: TdxBarLargeButton;
    DataSetAbitAddInVedom: TpFIBDataSet;
    DataSourceAbitAddInVedom: TDataSource;
    cxGridAbitAddInVedom: TcxGrid;
    cxGridAbitAddInVedomDBTableView1: TcxGridDBTableView;
    colFIO: TcxGridDBColumn;
    colNOMER_DELA: TcxGridDBColumn;
    colNPP: TcxGridDBColumn;
    cxGridAbitAddInVedomLevel1: TcxGridLevel;
    procedure FormCreate(Sender: TObject);
    procedure ActionVibratExecute(Sender: TObject);
    procedure ActionOtmenaExecute(Sender: TObject);
    procedure ActionObnovExecute(Sender: TObject);
  private
    IVADLang  :Integer;
    FSelectSQLTextIVAD: string;
    procedure InicCaption;
    procedure SetSelectSQLTextIVAD(const Value: string);
  public
    Property SelectSQLTextIVAD     :string read FSelectSQLTextIVAD write SetSelectSQLTextIVAD;
  end;

var
  FormISPIT_VEDOM_ABIT_ADD: TFormISPIT_VEDOM_ABIT_ADD;

implementation
uses
   uConstants,uPRK_DT_ISPIT_OCENKA,uPrK_Ekz_Vedom;
{$R *.dfm}

{ TFormISPIT_VEDOM_ABIT_ADD }

procedure TFormISPIT_VEDOM_ABIT_ADD.FormCreate(Sender: TObject);
begin
   SelectSQLTextIVAD:= 'Select * from PRK_DT_ISPIT_VEDOM_ABIT_ADD(:ID_DT_ISPIT_VEDOM)';
   InicCaption;
end;

procedure TFormISPIT_VEDOM_ABIT_ADD.InicCaption;
begin
   IVADLang:=TFormPRK_DT_ISPIT_OCENKA(self.Owner).IOLangEdit;
   TFormISPIT_VEDOM_ABIT_ADD(self).Caption :=nFormISPIT_VEDOM_ABIT_ADD_Caption[IVADLang];

   ActionVibrat.Caption                 :=nAction_Vibrat[IVADLang];
   ActionObnov.Caption                  :=nActiont_Obnov[IVADLang];
   ActionOtmena.Caption                 :=nAction_Exit[IVADLang];

   ActionVibrat.Hint                    :=nHintAction_Vibrat[IVADLang];
   ActionObnov.Hint                     :=nHintAction_Obnov[IVADLang];
   ActionOtmena.Hint                    :=nHintAction_Exit[IVADLang];

   colNPP.Caption                          :=ncolNPP[IVADLang];
   colFIO.Caption                          :=ncolFIO[IVADLang];
   colNOMER_DELA.Caption                   :=ncolNOMER_DELA[IVADLang];

   cxGridAbitAddInVedomDBTableView1.Styles.Header     :=TFormPrK_Ekz_Vedom(Self.Owner.owner).cxStyleHeader;
   cxGridAbitAddInVedomDBTableView1.Styles.Background :=TFormPrK_Ekz_Vedom(Self.Owner.owner).cxStyleBackGround_Content;
   cxGridAbitAddInVedomDBTableView1.Styles.Content    :=TFormPrK_Ekz_Vedom(Self.Owner.owner).cxStyleBackGround_Content;
   cxGridAbitAddInVedomDBTableView1.Styles.Selection  :=TFormPrK_Ekz_Vedom(Self.Owner.owner).cxStyleSelection;
   cxGridAbitAddInVedomDBTableView1.Styles.Inactive   :=TFormPrK_Ekz_Vedom(Self.Owner.owner).cxStyleInactive;
end;

procedure TFormISPIT_VEDOM_ABIT_ADD.SetSelectSQLTextIVAD(
  const Value: string);
begin
  FSelectSQLTextIVAD := Value;
  DataSetAbitAddInVedom.Active                      :=false;
  DataSetAbitAddInVedom.Database                    :=TFormPrK_Ekz_Vedom(self.Owner.owner).DataBasePrKEkzVedom;
    DataSetAbitAddInVedom.Transaction               :=TFormPrK_Ekz_Vedom(self.Owner.owner).TransactionReadPrKEkzVedom;
    DataSetAbitAddInVedom.SelectSQL.Clear;
    DataSetAbitAddInVedom.SQLs.SelectSQL.Text       :=FSelectSQLTextIVAD;
    DataSetAbitAddInVedom.ParamByName('ID_DT_ISPIT_VEDOM').AsInt64     :=TFormPRK_DT_ISPIT_OCENKA(self.owner).DataIO['input']['ID_DT_ISPIT_VEDOM'].AsInt64;
    DataSetAbitAddInVedom.CloseOpen(true);
end;

procedure TFormISPIT_VEDOM_ABIT_ADD.ActionVibratExecute(Sender: TObject);
begin
  if DataSetAbitAddInVedom.FieldValues['ID_DT_ABIT']<>Null then
  begin
    TFormPrK_Ekz_Vedom(self.Owner.Owner).StoredProcPrKEkzVedom.Transaction.StartTransaction;
    TFormPrK_Ekz_Vedom(self.Owner.Owner).StoredProcPrKEkzVedom.StoredProcName:='PRK_DT_ISPIT_OCENKA_ADD';
    TFormPrK_Ekz_Vedom(self.Owner.Owner).StoredProcPrKEkzVedom.Prepare;
    TFormPrK_Ekz_Vedom(self.Owner.Owner).StoredProcPrKEkzVedom.ParamByName('ID_DT_ISPIT_VEDOM').AsInt64   :=TFormPRK_DT_ISPIT_OCENKA(self.owner).DataIO['input']['ID_DT_ISPIT_VEDOM'].AsInt64;
    TFormPrK_Ekz_Vedom(self.Owner.Owner).StoredProcPrKEkzVedom.ParamByName('ID_DT_ABIT').AsInt64          :=DataSetAbitAddInVedom.FieldValues['ID_DT_ABIT'];
    TFormPrK_Ekz_Vedom(self.Owner.Owner).StoredProcPrKEkzVedom.ParamByName('ID_SP_OCENKA').AsInt64        :=-1;
    TFormPrK_Ekz_Vedom(self.Owner.Owner).StoredProcPrKEkzVedom.ParamByName('KOLVO_BALLOV').AsInteger      :=0;
    TFormPrK_Ekz_Vedom(self.Owner.Owner).StoredProcPrKEkzVedom.ParamByName('IS_ABIT_SELECT').AsInteger    :=1;
    TFormPrK_Ekz_Vedom(self.Owner.Owner).StoredProcPrKEkzVedom.ParamByName('ID_USER').AsInt64             :=TFormPrK_Ekz_Vedom(self.Owner.owner).ID_USER_GLOBAL;
     try
        TFormPrK_Ekz_Vedom(self.Owner.Owner).StoredProcPrKEkzVedom.ExecProc;
        TFormPrK_Ekz_Vedom(self.Owner.Owner).StoredProcPrKEkzVedom.Transaction.commit;
     except on e: Exception do
        begin
           MessageBox(Handle,Pchar(nMsgErrorTransaction[IVADLang]+chr(13)+
                      nMsgTryAgain[IVADLang]+nMsgOr[IVADLang]+nMsgToAdmin[IVADLang]+chr(13)+
                      e.Message),Pchar(nMsgBoxTitle[IVADLang]),MB_OK or MB_ICONWARNING);
           TFormPrK_Ekz_Vedom(self.Owner.Owner).StoredProcPrKEkzVedom.Transaction.Rollback;
           Exit;
        end;
     end;
    ModalResult :=MrOk;
  End;
end;

procedure TFormISPIT_VEDOM_ABIT_ADD.ActionOtmenaExecute(Sender: TObject);
begin
  close;
end;

procedure TFormISPIT_VEDOM_ABIT_ADD.ActionObnovExecute(Sender: TObject);
begin
  DataSetAbitAddInVedom.CloseOpen(false);
end;

end.
