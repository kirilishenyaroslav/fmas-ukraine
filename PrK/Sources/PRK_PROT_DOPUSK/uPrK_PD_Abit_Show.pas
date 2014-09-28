unit uPrK_PD_Abit_Show;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, FIBDataSet, pFIBDataSet,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, cxControls, cxGridCustomView, cxGrid, dxBar, dxBarExtItems,
  ActnList, ImgList,AArray, cxGroupBox, cxTextEdit, cxLabel, cxContainer,
  cxMaskEdit, cxDropDownEdit, cxCalendar;

type
  TFormPrK_PD_Abit_Show = class(TForm)
    cxGridPrKPZ_AbitShow: TcxGrid;
    cxGridPrKPZ_AbitShowDBTableView1: TcxGridDBTableView;
    colFIO: TcxGridDBColumn;
    colSHORT_NAME_FAK: TcxGridDBColumn;
    colSHORT_NAME_SPEC: TcxGridDBColumn;
    colSHORT_NAME_FORM_STUD: TcxGridDBColumn;
    cxGridPrKPZ_AbitShowLevel1: TcxGridLevel;
    DataSourcePrKPZ_AbitShow: TDataSource;
    DataSetPrKPZ_AbitShow: TpFIBDataSet;
    ActionListPrK: TActionList;
    ActionADD: TAction;
    ActionDEL: TAction;
    ActionObnov: TAction;
    ActionOtmena: TAction;
    ImageListPrk: TImageList;
    dxBarManagerPrk: TdxBarManager;
    dxBarLargeButtonAdd: TdxBarLargeButton;
    dxBarLargeButtonDel: TdxBarLargeButton;
    dxBarLargeButtonObnov: TdxBarLargeButton;
    dxBarLargeButtonOtmena: TdxBarLargeButton;
    cxGroupBoxProt: TcxGroupBox;
    cxGroupBoxPrik: TcxGroupBox;
    cxDateEditDate: TcxDateEdit;
    cxLabelDate: TcxLabel;
    cxTextEditNomer: TcxTextEdit;
    cxLabelNomer: TcxLabel;
    cxDateEditDateZarah: TcxDateEdit;
    cxDateEditDatePrikaz: TcxDateEdit;
    cxLabelDateZarah: TcxLabel;
    cxLabelDatePrikaz: TcxLabel;
    cxTextEditNomerPr: TcxTextEdit;
    cxLabelNomerPr: TcxLabel;
    procedure ActionOtmenaExecute(Sender: TObject);
    procedure ActionADDExecute(Sender: TObject);
    procedure ActionObnovExecute(Sender: TObject);
    procedure ActionDELExecute(Sender: TObject);
  private
    LangEdit :integer;
    FSelectSQLTextPZAS: String;
    DataPZAS :TAArray;
    procedure InicCaption;
    procedure SetSelectSQLTextPZAS(const Value: String);
    procedure Obnovit(Id_Obnov:int64);
  public
    constructor Create(aOwner: TComponent;aParam :TAArray);overload;
    Property SelectSQLTextPZAS      :String read FSelectSQLTextPZAS write SetSelectSQLTextPZAS;
  end;

var
  FormPrK_PD_Abit_Show: TFormPrK_PD_Abit_Show;

implementation
uses
 uPrK_PROT_DOPUSK,uPrK_Resources,
 uConstants,uPrK_PD_Abit_Show_Add;
{$R *.dfm}

{ TFormPrK_PZ_Abit_Show }

constructor TFormPrK_PD_Abit_Show.Create(aOwner: TComponent;
  aParam: TAArray);
begin
  inherited Create(aOwner);
  InicCaption;
  DataPZAS:= aParam;
  if DataPZAS['Prot_Prikaz'].AsInteger=1
   then begin
       // Протокол
       cxGroupBoxProt.Visible := True;
       cxTextEditNomer.Text   := TFormPrK_PROT_DOPUSK(Self.Owner).DataSetPrKPZ.FieldValues['NOMER'];
       cxDateEditDate.Date    := TFormPrK_PROT_DOPUSK(Self.Owner).DataSetPrKPZ.FieldValues['DATE_FORM'];
   end
   else begin
       // Приказ
      { cxGroupBoxPrik.Visible    := True;
       cxDateEditDateZarah.Date  := TFormPrK_PROT_DOPUSK(Self.Owner).DataSetPZ_Right.FieldValues['DATE_ZARAX'];
       cxDateEditDatePrikaz.Date := TFormPrK_PROT_DOPUSK(Self.Owner).DataSetPZ_Right.FieldValues['DATE_PRIKAZ'];
       cxTextEditNomerPr.Text    := TFormPrK_PROT_DOPUSK(Self.Owner).DataSetPZ_Right.FieldValues['NOMER']; }
   end;
  SelectSQLTextPZAS := DataPZAS['SelectSQL_Text'].AsString;
end;

procedure TFormPrK_PD_Abit_Show.InicCaption;
begin
 LangEdit :=SelectLanguage;

    dxBarManagerPrk.Bars[0].BorderStyle    :=bbsNone;
    dxBarManagerPrk.Bars[0].ShowMark       :=false;
    dxBarManagerPrk.CanCustomize           :=false;
    dxBarManagerPrk.Bars[0].AllowClose       :=false;
    dxBarManagerPrk.Bars[0].AllowCustomizing    :=false;
    dxBarManagerPrk.Bars[0].AllowQuickCustomizing  :=false;
    dxBarManagerPrk.Bars[0].AllowReset                :=false;

    cxGridPrKPZ_AbitShowDBTableView1.Styles.Header     :=TFormPrK_PROT_DOPUSK(Self.Owner).cxStyleHeader;
    cxGridPrKPZ_AbitShowDBTableView1.Styles.Background :=TFormPrK_PROT_DOPUSK(Self.Owner).cxStyleBackGround_Content;
    cxGridPrKPZ_AbitShowDBTableView1.Styles.Content    :=TFormPrK_PROT_DOPUSK(Self.Owner).cxStyleBackGround_Content;
    cxGridPrKPZ_AbitShowDBTableView1.Styles.Selection  :=TFormPrK_PROT_DOPUSK(Self.Owner).cxStyleSelection;
    cxGridPrKPZ_AbitShowDBTableView1.Styles.Inactive   :=TFormPrK_PROT_DOPUSK(Self.Owner).cxStyleInactive;


    ActionADD.Caption                    :=nAction_Add[LangEdit];
    ActionDEL.Caption                    :=nAction_Del[LangEdit];
    ActionObnov.Caption                  :=nActiont_Obnov[LangEdit];
    ActionOtmena.Caption                 :=nAction_Exit[LangEdit];

    ActionADD.Hint                       :=nHintAction_Add[LangEdit];
    ActionDEL.Hint                       :=nHintAction_Del[LangEdit];
    ActionObnov.Hint                     :=nHintAction_Obnov[LangEdit];
    ActionOtmena.Hint                    :=nHintAction_Exit[LangEdit];

    cxLabelNomer.Caption                   :=nLabelNomer[LangEdit];
    cxLabelDate.Caption                    :=nLabelDateForm[LangEdit];

    cxLabelNomerPr.Caption                 :=nLabelNomer[LangEdit];
    cxLabelDateZarah.Caption               :=nLabelDateZarah[LangEdit];
    cxLabelDatePrikaz.Caption              :=nLabelDatePrikaz[LangEdit];

    colFIO.Caption                         :=ncolFIO[LangEdit];
    colSHORT_NAME_FAK.Caption              :=ncolNAME_FAK[LangEdit];
    colSHORT_NAME_SPEC.Caption             :=ncolNAME_SPEC[LangEdit];
    colSHORT_NAME_FORM_STUD.Caption        :=ncolSHORT_NAME_CN_FORM_STUD[LangEdit];
end;

procedure TFormPrK_PD_Abit_Show.Obnovit(Id_Obnov: int64);
begin
  DataSetPrKPZ_AbitShow.CloseOpen(false);
  DataSetPrKPZ_AbitShow.Locate('ID_DT_ABIT',Id_Obnov,[]);
end;

procedure TFormPrK_PD_Abit_Show.SetSelectSQLTextPZAS(const Value: String);
begin
  FSelectSQLTextPZAS := Value;
    DataSetPrKPZ_AbitShow.Active                      :=false;
    DataSetPrKPZ_AbitShow.Database                    :=TFormPrK_PROT_DOPUSK(self.Owner).DataBasePrk;
    DataSetPrKPZ_AbitShow.Transaction                 :=TFormPrK_PROT_DOPUSK(self.Owner).TransactionReadPrK;
    DataSetPrKPZ_AbitShow.SelectSQL.Clear;
    DataSetPrKPZ_AbitShow.SQLs.SelectSQL.Text         :=FSelectSQLTextPZAS;
    DataSetPrKPZ_AbitShow.ParamByName(DataPZAS['ParamName'].AsString).AsInt64   :=DataPZAS['ParamValue'].AsInt64;
    DataSetPrKPZ_AbitShow.ParamByName('ID_SP_GOD_NABORA').AsInt64               :=TFormPrK_PROT_DOPUSK(self.Owner).ID_GOD_NABORA_GLOBAL;
    DataSetPrKPZ_AbitShow.CloseOpen(true);
end;

procedure TFormPrK_PD_Abit_Show.ActionOtmenaExecute(Sender: TObject);
begin
   close;
end;

procedure TFormPrK_PD_Abit_Show.ActionADDExecute(Sender: TObject);
var
   DataPrAdd :TAArray;
   T:TFormPrK_PD_Abit_Show_Add;
   TryAgain :boolean;
begin
   TryAgain:=false;
   DataPrAdd :=TAArray.Create;
   DataPrAdd['SelectSQL_Text'].AsString   :=DataPZAS['SelectSQL_Text_Add'].AsString;

   if DataSetPrKPZ_AbitShow.FieldValues['ID_DT_ABIT']<>Null
      then DataPrAdd['ID'].AsInt64:=DataSetPrKPZ_AbitShow.FieldValues['ID_DT_ABIT'];

   T := TFormPrK_PD_Abit_Show_Add.Create(self,DataPrAdd);

   T.Caption :=nFormPrK_PZ_Abit_Show_Add_Caption[LangEdit];

   if T.ShowModal=MrOk then
    begin
       TFormPrK_PROT_DOPUSK(self.Owner).StoredProcPrK.Transaction.StartTransaction;
       TFormPrK_PROT_DOPUSK(self.Owner).StoredProcPrK.StoredProcName:=DataPZAS['StoredProcAddName'].AsString;
       TFormPrK_PROT_DOPUSK(self.Owner).StoredProcPrK.Prepare;
       TFormPrK_PROT_DOPUSK(self.Owner).StoredProcPrK.ParamByName(DataPZAS['ParamName'].AsString).AsInt64 :=DataPZAS['ParamValue'].AsInt64;
       TFormPrK_PROT_DOPUSK(self.Owner).StoredProcPrK.ParamByName('ID_DT_ABIT').AsInt64                   :=T.DataSetPrKPZ_AbitShow_Add.FieldValues['ID_DT_ABIT'];
       TFormPrK_PROT_DOPUSK(self.Owner).StoredProcPrK.ParamByName('ID_USER').AsInt64                      :=TFormPrK_PROT_DOPUSK(self.Owner).ID_USER_GLOBAL;
       try
          TFormPrK_PROT_DOPUSK(self.Owner).StoredProcPrK.ExecProc;
          TFormPrK_PROT_DOPUSK(self.Owner).StoredProcPrK.Transaction.commit;
          DataPrAdd['ID'].AsInt64:=T.DataSetPrKPZ_AbitShow_Add.FieldValues['ID_DT_ABIT'];
       except on e: Exception do
          begin
             MessageBox(Handle,Pchar(nMsgErrorTransaction[LangEdit]+chr(13)+
                        nMsgTryAgain[LangEdit]+nMsgOr[LangEdit]+nMsgToAdmin[LangEdit]+chr(13)+
                        e.Message),Pchar(nMsgBoxTitle[LangEdit]),MB_OK or MB_ICONWARNING);
             TFormPrK_PROT_DOPUSK(self.Owner).StoredProcPrK.Transaction.Rollback;
             TryAgain:=true;
          end;
       end;
    end;
   T.Free;
   T:=nil;
   Obnovit(DataPrAdd['ID'].AsInt64);
   DataPrAdd.Free;
   DataPrAdd:=Nil;

   if TryAgain=true
      then ActionADDExecute(Sender); 
end;

procedure TFormPrK_PD_Abit_Show.ActionObnovExecute(Sender: TObject);
begin
   if DataSetPrKPZ_AbitShow.FieldValues['ID_DT_ABIT']<>Null
    then Obnovit(DataSetPrKPZ_AbitShow.FieldValues['ID_DT_ABIT'])
    else Obnovit(-1);
end;

procedure TFormPrK_PD_Abit_Show.ActionDELExecute(Sender: TObject);
begin

    if DataSetPrKPZ_AbitShow.FieldValues['ID_DT_ABIT']<>Null then
     begin
       if prkMessageDlg(nMsgBoxTitle[LangEdit],nMsgDel[LangEdit],
                        mtInformation,mbOKCancel,LangEdit)=mrOK then
         begin
            TFormPrK_PROT_DOPUSK(self.Owner).StoredProcPrK.Transaction.StartTransaction;
            TFormPrK_PROT_DOPUSK(self.Owner).StoredProcPrK.StoredProcName:=DataPZAS['StoredProcDelName'].AsString;
            TFormPrK_PROT_DOPUSK(self.Owner).StoredProcPrK.Prepare;
            TFormPrK_PROT_DOPUSK(self.Owner).StoredProcPrK.ParamByName('ID_DT_ABIT').AsInt64     := DataSetPrKPZ_AbitShow.FieldValues['ID_DT_ABIT'];
            TFormPrK_PROT_DOPUSK(self.Owner).StoredProcPrK.ParamByName('ID_USER').AsInt64        := TFormPrK_PROT_DOPUSK(self.Owner).ID_USER_GLOBAL;
            try
              TFormPrK_PROT_DOPUSK(self.Owner).StoredProcPrK.ExecProc;
              TFormPrK_PROT_DOPUSK(self.Owner).StoredProcPrK.Transaction.Commit;
              cxGridPrKPZ_AbitShowDBTableView1.NavigatorButtons.Prior.Click;
            except on e :Exception do
               begin
                 MessageBox(Handle,Pchar(nMsgErrorTransaction[LangEdit]+chr(13)+
                        nMsgTryAgain[LangEdit]+nMsgOr[LangEdit]+nMsgToAdmin[LangEdit]+chr(13)+
                        e.Message),Pchar(nMsgBoxTitle[LangEdit]),MB_OK or MB_ICONWARNING);
                 TFormPrK_PROT_DOPUSK(self.Owner).StoredProcPrK.Transaction.Rollback;
               end;
            end;
         end;
         Obnovit(StrToInt64(DataSetPrKPZ_AbitShow.FieldValues['ID_DT_ABIT']));
     end;
end;

end.
