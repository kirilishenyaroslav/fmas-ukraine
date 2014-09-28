unit UCardGetAssignConfigure;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, StdCtrls, ComCtrls, ToolWin,

  cxStyles, cxCustomData,
  cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData,
  cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,

  Ibase,Menus, FIBDatabase, pFIBDatabase,DateUtils,
  FIBDataSet, pFIBDataSet,pFibStoredProc, ExtCtrls, Buttons,IB_Externals,RegUnit,
  cxCheckBox, cxTextEdit, Resources_unitb, GlobalSpr,
  cxGridBandedTableView, cxGridDBBandedTableView, cxContainer, cxDBEdit,
  cxProgressBar, cxDBProgressBar,FibQuery, cxMaskEdit,
  cxDropDownEdit, cxLookAndFeelPainters, cxButtons, cxSpinEdit, cxTimeEdit,
  cxCalendar, cxButtonEdit, frxClass, frxDBSet;



type
  TfrmAssignConfigureForm = class(TForm)
    cbMonthBeg: TcxComboBox;
    cbYearBeg: TcxComboBox;
    cbMonthEnd: TcxComboBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    Label5: TLabel;
    cxButtonEdit2: TcxButtonEdit;
    Label6: TLabel;
    cxButtonEdit3: TcxButtonEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxButton2Click(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure cxButtonEdit3PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButtonEdit2PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }

  public
     id_user:Int64;
     id_pkv   : int64;
     pkv_kod  : String;
     pkv_title: string;
     id_tfin   : int64;
     tfin_kod  : String;
     tfin_title: string;
     date_beg   : TDateTime;
     date_end   : TDateTime;
     { Public declarations }
     constructor Create(AOwner:TComponent);reintroduce;
  end;


implementation

uses UcardGetAssign;

{$R *.dfm}
constructor TfrmAssignConfigureForm.Create(AOwner: TComponent);
var i:Integer;
begin
      inherited Create(AOwner);

      cbMonthBeg.Properties.Items.Add(TRIM(BU_Month_01));
      cbMonthBeg.Properties.Items.Add(TRIM(BU_Month_02));
      cbMonthBeg.Properties.Items.Add(TRIM(BU_Month_03));
      cbMonthBeg.Properties.Items.Add(TRIM(BU_Month_04));
      cbMonthBeg.Properties.Items.Add(TRIM(BU_Month_05));
      cbMonthBeg.Properties.Items.Add(TRIM(BU_Month_06));
      cbMonthBeg.Properties.Items.Add(TRIM(BU_Month_07));
      cbMonthBeg.Properties.Items.Add(TRIM(BU_Month_08));
      cbMonthBeg.Properties.Items.Add(TRIM(BU_Month_09));
      cbMonthBeg.Properties.Items.Add(TRIM(BU_Month_10));
      cbMonthBeg.Properties.Items.Add(TRIM(BU_Month_11));
      cbMonthBeg.Properties.Items.Add(TRIM(BU_Month_12));

      for i:=0 to YEARS_COUNT do
      begin
          cbYearBeg.Properties.Items.Add(TRIM(IntToStr(BASE_YEAR+i)));
      end;

      cbMonthBeg.ItemIndex:=0;
      for i:=0 to cbYearBeg.Properties.Items.Count-1 do
      begin
           if pos(cbYearBeg.Properties.Items[i],IntToStr(YearOf(Date)))>0
           then begin
                     cbYearBeg.ItemIndex:=i;
                     break;
           end;
      end;

      cbMonthEnd.Properties.Items.Add(TRIM(BU_Month_01));
      cbMonthEnd.Properties.Items.Add(TRIM(BU_Month_02));
      cbMonthEnd.Properties.Items.Add(TRIM(BU_Month_03));
      cbMonthEnd.Properties.Items.Add(TRIM(BU_Month_04));
      cbMonthEnd.Properties.Items.Add(TRIM(BU_Month_05));
      cbMonthEnd.Properties.Items.Add(TRIM(BU_Month_06));
      cbMonthEnd.Properties.Items.Add(TRIM(BU_Month_07));
      cbMonthEnd.Properties.Items.Add(TRIM(BU_Month_08));
      cbMonthEnd.Properties.Items.Add(TRIM(BU_Month_09));
      cbMonthEnd.Properties.Items.Add(TRIM(BU_Month_10));
      cbMonthEnd.Properties.Items.Add(TRIM(BU_Month_11));
      cbMonthEnd.Properties.Items.Add(TRIM(BU_Month_12));


      cbMonthEnd.ItemIndex:=MonthOf(IncMonth(Date,1))-1;


end;

procedure TfrmAssignConfigureForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    Action:=caFree;
end;



procedure TfrmAssignConfigureForm.cxButton2Click(Sender: TObject);
begin
     Close;
end;


procedure TfrmAssignConfigureForm.cxButton1Click(Sender: TObject);
begin
     date_beg   :=StrToDate('01.'+IntToStr(cbMonthBeg.ItemIndex+1)+'.'+cbYearBeg.Properties.Items[cbYearBeg.ItemIndex]);
     date_end   :=StrToDate('01.'+IntToStr(cbMonthEnd.ItemIndex+1)+'.'+cbYearBeg.Properties.Items[cbYearBeg.ItemIndex]);

     ModalResult:=mrYes;
end;

procedure TfrmAssignConfigureForm.cxButtonEdit3PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var Res:Variant;
    GetInfoDS:TpFibDataSet;
begin
     Res:=GlobalSpr.GetSmPKV(self,
                             TfrmGetAssignMain(Owner).WorkDatabase.Handle,
                             fsNormal,
                             id_user);
     if (Res<>Variant(0))
     then begin
               id_pkv:=VarAsType(Res,varInt64);
               GetInfoDS:=TpFibDataSet.Create(self);
               GetInfoDS.Database:=TfrmGetAssignMain(Owner).WorkDatabase;
               GetInfoDS.Transaction:=TfrmGetAssignMain(Owner).ReadTransaction;
               GetInfoDS.SelectSQL.Text:='SELECT * FROM pub_sp_sm_pkv WHERE ID_PKV='+IntToStr(id_pkv);
               GetInfoDS.Open;
               if (GetInfoDS.RecordCount>0)
               then begin
                         pkv_kod  :=GetInfoDS.FieldByName('PKV_KOD').AsString;
                         pkv_title:=GetInfoDS.FieldByName('PKV_TITLE').AsString;
                         cxButtonEdit3.Text:=pkv_kod+' "'+pkv_title+'"';                         
               end;
               GetInfoDS.Close;
               GetInfoDS.Free;
     end;
end;

procedure TfrmAssignConfigureForm.cxButtonEdit2PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var Res:Variant;
    GetInfoDS:TpFibDataSet;
begin
     Res:=GlobalSpr.GetTypeFinance(self,
                                   TfrmGetAssignMain(Owner).WorkDatabase.Handle,
                                   fsNormal,
                                   id_user);
     if (Res<>Variant(0))
     then begin
               id_tfin:=VarAsType(Res,varInt64);
               GetInfoDS:=TpFibDataSet.Create(self);
               GetInfoDS.Database:=TfrmGetAssignMain(Owner).WorkDatabase;
               GetInfoDS.Transaction:=TfrmGetAssignMain(Owner).ReadTransaction;
               GetInfoDS.SelectSQL.Text:='SELECT * FROM pub_sp_type_finance WHERE ID_TYPE_FINANCE='+IntToStr(id_tfin);
               GetInfoDS.Open;
               if (GetInfoDS.RecordCount>0)
               then begin
                         tfin_kod          :=GetInfoDS.FieldByName('TYPE_FINANCE_CODE').AsString;
                         tfin_title        :=GetInfoDS.FieldByName('TYPE_FINANCE_NAME').AsString;
                         cxButtonEdit2.Text:=tfin_kod+' "'+tfin_title+'"';
               end;
               GetInfoDS.Close;
               GetInfoDS.Free;
     end;
end;

procedure TfrmAssignConfigureForm.FormShow(Sender: TObject);
begin
      cxButtonEdit3.Text:=pkv_kod+' "'+pkv_title+'"';
      cxButtonEdit2.Text:=tfin_kod+' "'+tfin_title+'"';
end;

end.
