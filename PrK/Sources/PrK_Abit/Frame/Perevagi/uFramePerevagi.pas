unit uFramePerevagi;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, FIBDataSet, pFIBDataSet,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, cxControls, cxGridCustomView, cxGrid, cxGroupBox, cxLabel,
  cxDropDownEdit, cxCheckBox, RxMemDS, cxGridCardView, StdCtrls, cxSplitter,
  uPrK_Resources, FIBQuery, pFIBQuery, pFIBStoredProc;

type
  TFramePerevagi = class(TFrame)
    cxGroupBoxPerevagi: TcxGroupBox;
    DataSetKatPreim: TpFIBDataSet;
    DataSourceKatPreim: TDataSource;
    DataSourcePreim: TDataSource;
    RxMemoryDataPreim: TRxMemoryData;
    DataSetPreim: TpFIBDataSet;
    cxGridPrKSelectionPreim: TcxGrid;
    cxGridPrKSelectionPreimDBTableView1: TcxGridDBTableView;
    colNamePreimSelect: TcxGridDBColumn;
    cxGridPrKSelectionPreimLevel1: TcxGridLevel;
    cxGridPrKSpravOneLevel: TcxGrid;
    cxGridPrKSpravOneLevelDBTableView1: TcxGridDBTableView;
    colNamePreimKat: TcxGridDBColumn;
    cxGridPrKSpravOneLevelDBTableView2: TcxGridDBTableView;
    colNamePreim: TcxGridDBColumn;
    colIS_SELECTED: TcxGridDBColumn;
    cxGridPrKSpravOneLevelLevel1: TcxGridLevel;
    cxGridPrKSpravOneLevelLevel2: TcxGridLevel;
    cxSplitterSelectionPreim: TcxSplitter;
    DataSourceSelectionPreim: TDataSource;
    RxMemoryDataSelectionPreim: TRxMemoryData;
    RxMemoryDataCanUpdatePerevagi: TRxMemoryData;
    procedure RxMemoryDataPreimAfterPost(DataSet: TDataSet);
  private
    IndlangFP: integer;
    FSelectTextFramePerevagi: boolean;
    FSelectSQLTextPreim: string;
    FSelectSQLTextKatPreim: string;
    procedure SetSelectSQLTextPreim(const Value: string);
    procedure SetSelectTextFramePerevagi(const Value: boolean);
    procedure SetSelectSQLTextKatPreim(const Value: string);
    procedure GetObnovDataSetPerevagi;
  public
    procedure InicCaptionFrame;
    procedure InicDataFrame(rejim :RejimPrK);
    procedure OnActiveSheetPerevagi;
    procedure SavePreim;
    property SelectTextFramePerevagi :boolean read FSelectTextFramePerevagi write SetSelectTextFramePerevagi;
    property SelectSQLTextKatPreim :string read FSelectSQLTextKatPreim write SetSelectSQLTextKatPreim;
    property SelectSQLTextPreim :string read FSelectSQLTextPreim write SetSelectSQLTextPreim;
  end;

implementation
 uses
    uPRK_DT_ABIT,uConstants;
{$R *.dfm}

{ TFramePerevagi }

procedure TFramePerevagi.InicCaptionFrame;
var
   i: integer;
begin
    i:=TFormPRK_DT_ABIT(self.Owner).IndLangAbit;
    IndlangFP:=i;
    colNamePreimKat.Caption    :=ncolNamePreimKat[i];
    colNamePreim.Caption       :=ncolNamePreim[i];
    colIS_SELECTED.Caption     :=ncolIS_SELECTED[i];
    colNamePreimSelect.Caption :=ncolNamePreimSelect[i];
end;

procedure TFramePerevagi.SetSelectTextFramePerevagi(const Value: boolean);
begin
  FSelectTextFramePerevagi := Value;
  if FSelectTextFramePerevagi=true then
   begin
     SelectSQLTextKatPreim:='Select * from PRK_SP_PREIM_KATEGORY_SELECT';
     SelectSQLTextPreim  :='Select * from PRK_DT_ABIT_PREIM_SELECT(:ID_SP_DEPARTMENT_FAKU,:ID_CN_JN_FACUL_SPEC,:ID_CN_SP_FORM_STUD,:ID_CN_SP_KAT_STUD,:ID_MAN,:ID_DT_ABIT)';
   end;
end;

procedure TFramePerevagi.SetSelectSQLTextKatPreim(const Value: string);
begin
  FSelectSQLTextKatPreim := Value;
  DataSetKatPreim.Active                         :=false;
    DataSetKatPreim.Database                       := TFormPRK_DT_ABIT(self.Owner).DataBasePrK_ABIT;
    DataSetKatPreim.Transaction                    := TFormPRK_DT_ABIT(self.Owner).TransactionReadPrK_ABIT;
    DataSetKatPreim.SelectSQL.Clear;
    DataSetKatPreim.SQLs.SelectSQL.Text            := FSelectSQLTextKatPreim;
  DataSetKatPreim.CloseOpen(false);
  DataSetKatPreim.FetchAll;

end;

procedure TFramePerevagi.SetSelectSQLTextPreim(const Value: string);
begin
  FSelectSQLTextPreim := Value;

  RxMemoryDataCanUpdatePerevagi.Open;
  RxMemoryDataCanUpdatePerevagi.Insert;
    RxMemoryDataCanUpdatePerevagi.FieldByName('ID_CN_SP_FAK').Value          :=0;
    RxMemoryDataCanUpdatePerevagi.FieldByName('ID_CN_JN_FACUL_SPEC').Value   :=0;
    RxMemoryDataCanUpdatePerevagi.FieldByName('ID_CN_SP_FORM_STUD').Value    :=0;
    RxMemoryDataCanUpdatePerevagi.FieldByName('ID_CN_SP_KAT_STUD').Value     :=0;
    RxMemoryDataCanUpdatePerevagi.FieldByName('ID_MAN').Value                :=0;
  RxMemoryDataCanUpdatePerevagi.Post;

  DataSetPreim.Active                         :=false;
    DataSetPreim.Database                       := TFormPRK_DT_ABIT(self.Owner).DataBasePrK_ABIT;
    DataSetPreim.Transaction                    := TFormPRK_DT_ABIT(self.Owner).TransactionReadPrK_ABIT;
    DataSetPreim.SelectSQL.Clear;
    DataSetPreim.SQLs.SelectSQL.Text            := FSelectSQLTextPreim;

    // ѕри записи   в базу надо будет сделать RxMemoryDataPreim.edit; RxMemoryDataPreim.Post;
    // что бы все изменени€ по преимуществам прин€лись!!!

    DataSetPreim.ParamByName('ID_SP_DEPARTMENT_FAKU').AsInt64   :=TFormPRK_DT_ABIT(self.Owner).TFrameVstup1.DataSetFacul.FieldValues['ID_CN_SP_FAK'];
    DataSetPreim.ParamByName('ID_CN_JN_FACUL_SPEC').AsInt64     :=TFormPRK_DT_ABIT(self.Owner).TFrameVstup1.DataSetSpec.FieldValues['ID_CN_JN_FACUL_SPEC'];
    DataSetPreim.ParamByName('ID_CN_SP_FORM_STUD').AsInt64      :=TFormPRK_DT_ABIT(self.Owner).TFrameVstup1.DataSetFormStudy.FieldValues['ID_CN_SP_FORM_STUD'];
    DataSetPreim.ParamByName('ID_CN_SP_KAT_STUD').AsInt64       :=TFormPRK_DT_ABIT(self.Owner).TFrameVstup1.DataSetKatStud.FieldValues['ID_CN_SP_KAT_STUD'];
    DataSetPreim.ParamByName('ID_MAN').AsInt64                  :=TFormPRK_DT_ABIT(self.Owner).ResultArray['AbitData']['ID_MAN'].AsInt64;
    DataSetPreim.ParamByName('ID_DT_ABIT').AsInt64              :=TFormPRK_DT_ABIT(self.Owner).ID_DT_ABIT_GLOBAL;
    DataSetPreim.CloseOpen(false);
    DataSetPreim.FetchAll;
    RxMemoryDataSelectionPreim.Open;
    RxMemoryDataPreim.LoadFromDataSet(DataSetPreim,DataSetPreim.RecordCount,lmCopy);
    DataSetPreim.Active:=false;

end;

procedure TFramePerevagi.RxMemoryDataPreimAfterPost(DataSet: TDataSet);
var
   Id_Loc: int64;
begin

   Id_Loc:= RxMemoryDataPreim.FieldByName('ID_SP_PREIM').Value;
   RxMemoryDataSelectionPreim.Close;
   RxMemoryDataSelectionPreim.Open;

  // DataSourceKatPreim.Enabled :=false;
  // DataSourcePreim.Enabled    :=false;

   RxMemoryDataPreim.First;
   while not RxMemoryDataPreim.Eof do
   begin
      if RxMemoryDataPreim.FieldByName('IS_SELECTED').Value=1
       then begin
         RxMemoryDataSelectionPreim.Insert;
         RxMemoryDataSelectionPreim.FieldByName('ID_SP_PREIM').Value:=
                   RxMemoryDataPreim.FieldByName('ID_SP_PREIM').Value;
         RxMemoryDataSelectionPreim.FieldByName('SHORT_NAME_PREIM').Value:=
                   RxMemoryDataPreim.FieldByName('SHORT_NAME_PREIM').Value;
       end;
      RxMemoryDataPreim.Next;
   end;
   RxMemoryDataSelectionPreim.Edit;
   RxMemoryDataSelectionPreim.Post;

   RxMemoryDataPreim.Locate('ID_SP_PREIM',Id_Loc,[]);
  // DataSourcePreim.Enabled    :=true;
  // DataSourceKatPreim.Enabled :=true;

 //  RxMemoryDataPreim.Locate('ID_SP_PREIM',Id_Loc,[]);

end;

procedure TFramePerevagi.OnActiveSheetPerevagi;
begin
    // ѕроверка на то: ѕомен€лись ли во TFramePerevagi1 парметры, если да то
    // происходит обновление DataSetPerevagi
    // “ака€ организаци€ if'ов провер€ет сначала наиболее веро€тные возможности изменени€
    if RxMemoryDataCanUpdatePerevagi.FieldByName('ID_CN_SP_FORM_STUD').Value <>
       TFormPRK_DT_ABIT(self.Owner).TFrameVstup1.DataSetFormStudy.FieldValues['ID_CN_SP_FORM_STUD']
       then GetObnovDataSetPerevagi
       else if RxMemoryDataCanUpdatePerevagi.FieldByName('ID_CN_JN_FACUL_SPEC').Value <>
               TFormPRK_DT_ABIT(self.Owner).TFrameVstup1.DataSetSpec.FieldValues['ID_CN_JN_FACUL_SPEC']
               then GetObnovDataSetPerevagi
               else if RxMemoryDataCanUpdatePerevagi.FieldByName('ID_CN_SP_FAK').Value <>
                       TFormPRK_DT_ABIT(self.Owner).TFrameVstup1.DataSetFacul.FieldValues['ID_CN_SP_FAK']
                       then GetObnovDataSetPerevagi
                       else if RxMemoryDataCanUpdatePerevagi.FieldByName('ID_CN_SP_KAT_STUD').Value<>
                               TFormPRK_DT_ABIT(self.Owner).TFrameVstup1.DataSetKatStud.FieldValues['ID_CN_SP_KAT_STUD']
                               then GetObnovDataSetPerevagi
                               else if RxMemoryDataCanUpdatePerevagi.FieldByName('ID_MAN').Value<>
                                       TFormPRK_DT_ABIT(self.Owner).ResultArray['AbitData']['ID_MAN'].AsInt64
                                        then GetObnovDataSetPerevagi;
end;

procedure TFramePerevagi.GetObnovDataSetPerevagi;
begin
    RxMemoryDataCanUpdatePerevagi.Edit;
       RxMemoryDataCanUpdatePerevagi.FieldByName('ID_CN_SP_FORM_STUD').Value  :=
               TFormPRK_DT_ABIT(self.Owner).TFrameVstup1.DataSetFormStudy.FieldValues['ID_CN_SP_FORM_STUD'];
       RxMemoryDataCanUpdatePerevagi.FieldByName('ID_CN_JN_FACUL_SPEC').Value :=
               TFormPRK_DT_ABIT(self.Owner).TFrameVstup1.DataSetSpec.FieldValues['ID_CN_JN_FACUL_SPEC'];
       RxMemoryDataCanUpdatePerevagi.FieldByName('ID_CN_SP_FAK').Value        :=
               TFormPRK_DT_ABIT(self.Owner).TFrameVstup1.DataSetFacul.FieldValues['ID_CN_SP_FAK'];
       RxMemoryDataCanUpdatePerevagi.FieldByName('ID_CN_SP_KAT_STUD').Value   :=
               TFormPRK_DT_ABIT(self.Owner).TFrameVstup1.DataSetKatStud.FieldValues['ID_CN_SP_KAT_STUD'];
       RxMemoryDataCanUpdatePerevagi.FieldByName('ID_MAN').Value              :=
               TFormPRK_DT_ABIT(self.Owner).ResultArray['AbitData']['ID_MAN'].AsInt64;
    RxMemoryDataCanUpdatePerevagi.Post;

    DataSetKatPreim.CloseOpen(false);

   { ShowMessage(VarToStr(RxMemoryDataCanUpdatePerevagi.FieldByName('ID_CN_SP_FAK').Value));
    ShowMessage(VarToStr(RxMemoryDataCanUpdatePerevagi.FieldByName('ID_CN_JN_FACUL_SPEC').Value));
    ShowMessage(VarToStr(RxMemoryDataCanUpdatePerevagi.FieldByName('ID_CN_SP_FORM_STUD').Value));
    ShowMessage(VarToStr(RxMemoryDataCanUpdatePerevagi.FieldByName('ID_CN_SP_KAT_STUD').Value));
    ShowMessage(VarToStr(RxMemoryDataCanUpdatePerevagi.FieldByName('ID_MAN').Value));
    ShowMessage(VarToStr(TFormPRK_DT_ABIT(self.Owner).ID_DT_ABIT_GLOBAL));  }

    DataSetPreim.ParamByName('ID_SP_DEPARTMENT_FAKU').AsInt64   :=RxMemoryDataCanUpdatePerevagi.FieldByName('ID_CN_SP_FAK').Value;
    DataSetPreim.ParamByName('ID_CN_JN_FACUL_SPEC').AsInt64     :=RxMemoryDataCanUpdatePerevagi.FieldByName('ID_CN_JN_FACUL_SPEC').Value;
    DataSetPreim.ParamByName('ID_CN_SP_FORM_STUD').AsInt64      :=RxMemoryDataCanUpdatePerevagi.FieldByName('ID_CN_SP_FORM_STUD').Value;
    DataSetPreim.ParamByName('ID_CN_SP_KAT_STUD').AsInt64       :=RxMemoryDataCanUpdatePerevagi.FieldByName('ID_CN_SP_KAT_STUD').Value;
    DataSetPreim.ParamByName('ID_MAN').AsInt64                  :=RxMemoryDataCanUpdatePerevagi.FieldByName('ID_MAN').Value;
    DataSetPreim.ParamByName('ID_DT_ABIT').AsInt64              :=TFormPRK_DT_ABIT(self.Owner).ID_DT_ABIT_GLOBAL;
    DataSetPreim.CloseOpen(false);
    DataSetPreim.FetchAll;

    RxMemoryDataSelectionPreim.Open;
    RxMemoryDataPreim.Close;
    RxMemoryDataPreim.LoadFromDataSet(DataSetPreim,DataSetPreim.RecordCount,lmCopy);
    DataSetPreim.Active:=false;
end;

procedure TFramePerevagi.InicDataFrame(rejim: RejimPrK);
begin
// ¬озможно сдесь автоматически будут отбиратьс€ те данные, которые надо...
// ѕотому что сначала инициализируетс€ FrameVstyp... а в зависимости от него завис€щиее вкладки
   if rejim=ViewPrK then
   begin
       DataSourcePreim.AutoEdit:= false;
       // мен€€ так цвет - € мен€ю его в самом cxCtyleSkyBlue. ≈стественно он изменитс€ и вовсех компонентах исользующих этот стиль
       cxGridPrKSpravOneLevelDBTableView2.Styles.Content.Color:=TFormPRK_DT_ABIT(self.Owner).TextViewColor;
   end;
end;

procedure TFramePerevagi.SavePreim;
begin
  RxMemoryDataPreim.First;
  while not RxMemoryDataPreim.Eof do
  begin
    TFormPRK_DT_ABIT(self.Owner).StoredProcPrK_ABIT.StoredProcName:='PRK_DT_ABIT_PREIM_CHANGE';
    TFormPRK_DT_ABIT(self.Owner).StoredProcPrK_ABIT.Prepare;
    TFormPRK_DT_ABIT(self.Owner).StoredProcPrK_ABIT.ParamByName('ID_MAN').AsInt64           :=TFormPRK_DT_ABIT(self.Owner).ResultArray['AbitData']['ID_MAN'].AsInt64;
    TFormPRK_DT_ABIT(self.Owner).StoredProcPrK_ABIT.ParamByName('ID_DT_ABIT').AsInt64       :=TFormPRK_DT_ABIT(self.Owner).ID_ABIT_OUT;
    if RxMemoryDataPreim.FieldValues['ID_DT_PREIM']=Null
     then TFormPRK_DT_ABIT(self.Owner).StoredProcPrK_ABIT.ParamByName('ID_DT_PREIM').AsInt64      :=-1
     else TFormPRK_DT_ABIT(self.Owner).StoredProcPrK_ABIT.ParamByName('ID_DT_PREIM').AsInt64      :=RxMemoryDataPreim.FieldValues['ID_DT_PREIM'];
    TFormPRK_DT_ABIT(self.Owner).StoredProcPrK_ABIT.ParamByName('ID_SP_PREIM').AsInt64      :=RxMemoryDataPreim.FieldValues['ID_SP_PREIM'];
    TFormPRK_DT_ABIT(self.Owner).StoredProcPrK_ABIT.ParamByName('ID_USER').AsInt64          :=TFormPRK_DT_ABIT(self.Owner).ID_USER_GLOBAL;
    TFormPRK_DT_ABIT(self.Owner).StoredProcPrK_ABIT.ParamByName('IS_FIZL_LGOTA').AsInteger  :=RxMemoryDataPreim.FieldValues['IS_FIZL_LGOTA'];
    TFormPRK_DT_ABIT(self.Owner).StoredProcPrK_ABIT.ParamByName('IS_SELECTED').AsInteger    :=RxMemoryDataPreim.FieldValues['IS_SELECTED'];

     try
        TFormPRK_DT_ABIT(self.Owner).StoredProcPrK_ABIT.ExecProc;
     except on e: Exception do
        begin
           MessageBox(Handle,Pchar(nMsgErrorTransaction[IndlangFP]+chr(13)+
                      nMsgTryAgain[IndlangFP]+nMsgOr[IndlangFP]+nMsgToAdmin[IndlangFP]+chr(13)+
                      e.Message),Pchar(nMsgBoxTitle[IndlangFP]),MB_OK or MB_ICONWARNING);
           TFormPRK_DT_ABIT(self.Owner).StoredProcPrK_ABIT.Transaction.Rollback;
           TFormPRK_DT_ABIT(self.Owner).CanCommitAbitTr:=false;
           Exit;
        end;
     end;

    RxMemoryDataPreim.Next;
  end;
end;

end.
