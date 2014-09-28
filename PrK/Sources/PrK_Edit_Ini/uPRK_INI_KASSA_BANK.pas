unit uPRK_INI_KASSA_BANK;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,ibase,ib_externals,AArray, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, dxBar,
  dxBarExtItems, ActnList, ImgList, FIBDataSet, pFIBDataSet, FIBQuery,
  pFIBQuery, pFIBStoredProc, FIBDatabase, pFIBDatabase, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxControls, cxGridCustomView, cxGrid, cxLabel;

type
  TFormPRK_INI_KASSA_BANK = class(TForm)
    cxGridPrK: TcxGrid;
    cxGridPrKDBTableView1: TcxGridDBTableView;
    colID_RAZDEL: TcxGridDBColumn;
    colID_SMET: TcxGridDBColumn;
    colID_STATIYA: TcxGridDBColumn;
    cxGridPrKLevel1: TcxGridLevel;
    StyleRepository: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    cxStyle5: TcxStyle;
    cxStyle6: TcxStyle;
    cxStyleHeader: TcxStyle;
    cxStyle8: TcxStyle;
    cxStyle9: TcxStyle;
    cxStyleInactive: TcxStyle;
    cxStyle11: TcxStyle;
    cxStyleSkyBlue: TcxStyle;
    cxStyleBackGround_Content: TcxStyle;
    cxStyleSelection: TcxStyle;
    DataBasePrK: TpFIBDatabase;
    TransactionReadPrK: TpFIBTransaction;
    TransactionWritePrK: TpFIBTransaction;
    StoredProcPrK: TpFIBStoredProc;
    DataSetPrK: TpFIBDataSet;
    DataSourcePrK: TDataSource;
    ImageList: TImageList;
    ActionList: TActionList;
    ActionADD: TAction;
    ActionChange: TAction;
    ActionDEL: TAction;
    ActionView: TAction;
    ActionObnov: TAction;
    ActionVibrat: TAction;
    ActionOtmena: TAction;
    ActionPrint: TAction;
    dxBarManager: TdxBarManager;
    dxBarLargeButtonAdd: TdxBarLargeButton;
    dxBarLargeButtonChange: TdxBarLargeButton;
    dxBarLargeButtonVibrat: TdxBarLargeButton;
    dxBarLargeButtonObnov: TdxBarLargeButton;
    dxBarLargeButtonOtmena: TdxBarLargeButton;
    dxBarLargeButtonView: TdxBarLargeButton;
    dxBarLargeButtonDel: TdxBarLargeButton;
    colPROCENT: TcxGridDBColumn;
    colSRS: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
    procedure ActionADDExecute(Sender: TObject);
    procedure ActionObnovExecute(Sender: TObject);
    procedure ActionChangeExecute(Sender: TObject);
    procedure ActionDELExecute(Sender: TObject);
    procedure ActionOtmenaExecute(Sender: TObject);
  private
    DBHANDLE                :TISC_DB_HANDLE;
    ResultArray             :TAArray;
    FSelectSQLText: string;
    procedure SetSelectSQLText(const Value: string);
  public
    constructor Create(aOwner: TComponent;aParam :TAArray);overload;
    Property SelectSQLText   :string read FSelectSQLText write SetSelectSQLText;
  end;

  procedure ShowAllPrkBpl (aOwner: TComponent;aParam :TAArray);stdcall;
  exports   ShowAllPrkBpl;

var
  FormPRK_INI_KASSA_BANK: TFormPRK_INI_KASSA_BANK;

implementation
uses uPrK_Resources,uPRK_INI_KASSA_BANK_Edit,uConstants;
{$R *.dfm}
procedure ShowAllPrkBpl (aOwner: TComponent;aParam :TAArray);
var
 T :TFormPRK_INI_KASSA_BANK;
begin
   T:=TFormPRK_INI_KASSA_BANK.Create(aOwner,aParam);

   T.FormStyle:= aParam['Input']['aFrmStyle'].AsVariant;
   case T.FormStyle of
     fsNormal:   begin
                   T.ShowModal;
                   T.ActionVibrat.Enabled:=true;
                   T.dxBarLargeButtonVibrat.Visible:=ivAlways;
                 end;
     fsMDIChild: begin
                   T.ActionVibrat.Enabled:=false;
                   T.dxBarLargeButtonVibrat.Visible:=ivNever;
                 end;
     else
        T.Free;
   end;
end;
{ TFormPRK_INI_KASSA_BANK }

constructor TFormPRK_INI_KASSA_BANK.Create(aOwner: TComponent;
  aParam: TAArray);
begin
  if Assigned(PVoid(aParam['Input']['aDBHANDLE'])) then
   begin
      DBHANDLE      :=PVoid(aParam['Input']['aDBHANDLE'].asInteger);
      ResultArray   :=aParam;
      inherited Create(aOwner);
      if SelectShemaColor=1 then
       begin
          cxStyleBackGround_Content.Color           := $00EBC4A4;
          cxStyleInactive.Color                     := $00F7EAD9;
       end;
   end
   else ShowMessage('Ошибка HANDLE`a Базы');
end;

procedure TFormPRK_INI_KASSA_BANK.SetSelectSQLText(const Value: string);
begin
  FSelectSQLText := Value;
   DataBasePrK.close;
    DataSetPrK.Active                         :=false;
    DataBasePrK.Handle                        :=DBHANDLE;
    DataBasePrK.DefaultTransaction            := TransactionReadPrK;
    DataSetPrK.Database                       := DataBasePrK;
    DataSetPrK.Transaction                    := TransactionReadPrK;
    DataSetPrK.SelectSQL.Clear;
    DataSetPrK.SQLs.SelectSQL.Text            := FSelectSQLText;
    DataSetPrK.CloseOpen(false);
end;

procedure TFormPRK_INI_KASSA_BANK.FormCreate(Sender: TObject);
begin
   SelectSQLText    :='Select * from PRK_INI_KASSA_BANK_SELECT';
end;

procedure TFormPRK_INI_KASSA_BANK.ActionADDExecute(Sender: TObject);
var
   T:TFormPRK_INI_KASSA_BANK_Edit;
   TryAgain :boolean;
begin
   TryAgain:=false;

   T := TFormPRK_INI_KASSA_BANK_Edit.Create(self);
   T.cxTextEditProcent.Text:='';
   T.id_smeta :=-1;
   T.id_razd  :=-1;
   T.id_state :=-1;

   T.Caption :=nFormKlassSpravEdit_Add[0];

   if T.ShowModal=MrOk then
    begin
       StoredProcPrK.Transaction.StartTransaction;
       StoredProcPrK.StoredProcName:='PRK_INI_KASSA_BANK_ADD';
       StoredProcPrK.Prepare;
       StoredProcPrK.ParamByName('ID_RAZDEL').AsInt64     :=T.id_razd;
       StoredProcPrK.ParamByName('ID_SMET').AsInt64       :=T.id_smeta;
       StoredProcPrK.ParamByName('ID_STATIYA').AsInt64    :=T.id_state;
       StoredProcPrK.ParamByName('PROCENT').AsFloat       :=StrToFloat(T.cxTextEditProcent.Text);
       try
          StoredProcPrK.ExecProc;
          StoredProcPrK.Transaction.commit;
       except on e: Exception do
          begin
             MessageBox(Handle,Pchar(nMsgErrorTransaction[0]+chr(13)+
                        nMsgTryAgain[0]+nMsgOr[0]+nMsgToAdmin[0]+chr(13)+
                        e.Message),Pchar(nMsgBoxTitle[0]),MB_OK or MB_ICONWARNING);
             StoredProcPrK.Transaction.Rollback;
             TryAgain:=true;
          end;
       end;
    end;
   T.Free;
   T:=nil;
   if TryAgain=true
      then ActionADDExecute(Sender);
   ActionObnovExecute(Sender);
end;

procedure TFormPRK_INI_KASSA_BANK.ActionObnovExecute(Sender: TObject);
begin
  DataSetPrK.CloseOpen(false);
end;

procedure TFormPRK_INI_KASSA_BANK.ActionChangeExecute(Sender: TObject);
var
   T:TFormPRK_INI_KASSA_BANK_Edit;
   TryAgain :boolean;
   id_pos :Int64;
begin
   TryAgain:=false;

   if DataSetPrK.FieldValues['ID_INI_KASSA_BANK']=Null
    then exit;
   T := TFormPRK_INI_KASSA_BANK_Edit.Create(self);
   id_pos                   :=DataSetPrK.FieldValues['ID_INI_KASSA_BANK'];
   T.cxTextEditProcent.Text :=VartoStr(DataSetPrK.FieldValues['PROCENT']);
   T.cxButtonSRS.Caption    :=VartoStr(DataSetPrK.FieldValues['SRS']);
   T.id_smeta               :=DataSetPrK.FieldValues['ID_SMET'];
   T.id_razd                :=DataSetPrK.FieldValues['ID_RAZDEL'];
   T.id_state               :=DataSetPrK.FieldValues['ID_STATIYA'];

   T.Caption :=nFormKlassSpravEdit_Add[0];

   if T.ShowModal=MrOk then
    begin
       StoredProcPrK.Transaction.StartTransaction;
       StoredProcPrK.StoredProcName:='PRK_INI_KASSA_BANK_CHANGE';
       StoredProcPrK.Prepare;
       StoredProcPrK.ParamByName('ID_INI_KASSA_BANK').AsInt64 :=id_Pos;
       StoredProcPrK.ParamByName('ID_RAZDEL').AsInt64         :=T.id_razd;
       StoredProcPrK.ParamByName('ID_SMET').AsInt64           :=T.id_smeta;
       StoredProcPrK.ParamByName('ID_STATIYA').AsInt64        :=T.id_state;
       StoredProcPrK.ParamByName('PROCENT').AsFloat           :=StrToFloat(T.cxTextEditProcent.Text);
       try
          StoredProcPrK.ExecProc;
          StoredProcPrK.Transaction.commit;
       except on e: Exception do
          begin
             MessageBox(Handle,Pchar(nMsgErrorTransaction[0]+chr(13)+
                        nMsgTryAgain[0]+nMsgOr[0]+nMsgToAdmin[0]+chr(13)+
                        e.Message),Pchar(nMsgBoxTitle[0]),MB_OK or MB_ICONWARNING);
             StoredProcPrK.Transaction.Rollback;
             TryAgain:=true;
          end;
       end;
    end;
   T.Free;
   T:=nil;
   if TryAgain=true
      then ActionChangeExecute(Sender);
   ActionObnovExecute(Sender);
   DataSetPrK.Locate('ID_INI_KASSA_BANK',id_pos,[]);
end;
procedure TFormPRK_INI_KASSA_BANK.ActionDELExecute(Sender: TObject);
begin
   if DataSetPrK.FieldValues['ID_INI_KASSA_BANK']<>Null then
     begin
       if prkMessageDlg(nMsgBoxTitle[0],nMsgDel[0],
                        mtInformation,mbOKCancel,0)=mrOK then
         begin
            StoredProcPrK.Transaction.StartTransaction;
            StoredProcPrK.StoredProcName:='PRK_INI_KASSA_BANK_DEL';
            StoredProcPrK.Prepare;
            StoredProcPrK.ParamByName('ID_INI_KASSA_BANK').AsInt64:= DataSetPrK.FieldValues['ID_INI_KASSA_BANK'];
            try
              StoredProcPrK.ExecProc;
              StoredProcPrK.Transaction.Commit;
            except on e :Exception do
               begin
                 MessageBox(Handle,Pchar(nMsgErrorTransaction[0]+chr(13)+
                        nMsgTryAgain[0]+nMsgOr[0]+nMsgToAdmin[0]+chr(13)+
                        e.Message),Pchar(nMsgBoxTitle[0]),MB_OK or MB_ICONWARNING);
                 StoredProcPrK.Transaction.Rollback;
               end;
            end;
         end;
         ActionObnovExecute(Sender);
     end;
end;

procedure TFormPRK_INI_KASSA_BANK.ActionOtmenaExecute(Sender: TObject);
begin
 close;
end;

end.
