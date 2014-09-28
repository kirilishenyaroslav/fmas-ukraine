unit UEditPKV;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cxControls,
  cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxButtonEdit, ExtCtrls,
  pFibDataSet, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, DB, FIBDataSet;

type
  TfrmEditPKV = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    cxButtonEdit1: TcxButtonEdit;
    Label5: TLabel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    Label3: TLabel;
    cxButtonEdit2: TcxButtonEdit;
    Label4: TLabel;
    cbMonthBeg: TcxComboBox;
    cbMonthEnd: TcxComboBox;
    cbYearBeg: TcxComboBox;
    cbYearEnd: TcxComboBox;
    MOCharDataSet: TpFIBDataSet;
    MOCharDataSource: TDataSource;
    cxTextEdit1: TcxTextEdit;
    Label6: TLabel;
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure cxButtonEdit1PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButtonEdit2PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private
    { Private declarations }
    edit_flag:boolean;
    _checkMOparams:Boolean;
  public
    { Public declarations }
    Curr_Date:TDateTime;
    date_beg:TdateTime;
    date_end:TdateTime;
    in_date_beg:TdateTime;
    in_date_end:TdateTime;
    id_sm_pkv:int64;
    sm_pkv_text:string;
    id_type_finance:integer;
    type_finance:string;

    constructor Create(AOwner:TComponent;DateBeg,DateEnd:TDateTime;IdPKV:Int64;id_type_finance:Integer;EditFlag:Boolean;MO_char:Variant;checkMOparams:Boolean=true);reintroduce;
  end;

var
  frmEditPKV: TfrmEditPKV;

implementation

uses Resources_unitb, GlobalSpr, dateUtils, SmGrMain;

{$R *.dfm}

constructor TfrmEditPKV.Create(AOwner: TComponent; DateBeg,
  DateEnd: TDateTime; IdPKV: Int64;id_type_finance:Integer;EditFlag:Boolean;MO_char:Variant;checkMOparams:Boolean=true);
  var i:integer;
      PKVInfo:TpFibDataSet;
begin
       inherited Create(AOwner);
       _checkMOparams:=checkMOparams;
       self.in_date_beg:=DateBeg;
       self.in_date_end:=DateEnd;
       self.edit_flag  :=EditFlag;
       self.id_sm_pkv:=IdPKV;
       self.id_type_finance:=id_type_finance;
       self.Curr_Date:=DateBeg;

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

       for i:=0 to YEARS_COUNT do
       begin
          cbYearBeg.Properties.Items.Add(TRIM(IntToStr(BASE_YEAR+i)));
          cbYearEnd.Properties.Items.Add(TRIM(IntToStr(BASE_YEAR+i)));
       end;

       if edit_flag
       then begin
                 cbMonthbeg.ItemIndex:=MonthOf(in_date_beg)-1;
                 for i:=0 to cbYearBeg.Properties.Items.Count-1 do
                 begin
                     if pos(cbYearBeg.Properties.Items[i],IntToStr(YearOf(in_date_beg)))>0
                     then begin
                        cbYearBeg.ItemIndex:=i;
                        break;
                     end;
                 end;
                 cbMonthend.ItemIndex:=MonthOf(in_date_end)-1;
                 for i:=0 to cbYearend.Properties.Items.Count-1 do
                 begin
                     if pos(cbYearend.Properties.Items[i],IntToStr(YearOf(in_date_end)))>0
                     then begin
                        cbYearend.ItemIndex:=i;
                        break;
                     end;
                 end;

    end
    else begin
                 cbMonthbeg.ItemIndex:=MonthOf(Curr_Date)-1;
                 cbMonthend.ItemIndex:=cbMonthbeg.ItemIndex;
                 for i:=0 to cbYearBeg.Properties.Items.Count-1 do
                 begin
                     if pos(cbYearBeg.Properties.Items[i],IntToStr(YearOf(Curr_Date)))>0
                     then begin
                        cbYearBeg.ItemIndex:=i;
                        cbYearEnd.ItemIndex:=i;
                        break;
                     end;
                 end;
    end;

   PKVInfo:=TpFibDataSet.Create(self);
   PKVInfo.Database:=TfrmSmetaGroup(Owner).WorkDatabase;
   PKVInfo.Transaction:=TfrmSmetaGroup(Owner).ReadTransaction;
   PKVInfo.SelectSQL.Text:='SELECT * FROM PUB_SP_SM_PKV WHERE ID_PKV='+IntToStr(id_sm_pkv);
   PKVInfo.Open;
   PKVInfo.FetchAll;
   if (PKVInfo.RecordCount>0)
   then begin
             cxButtonEdit1.Text:=PKVInfo.FieldByName('PKV_KOD').AsString;
   end;
   PKVInfo.Close;

   PKVInfo.SelectSQL.Text:='SELECT * FROM PUB_SP_TYPE_FINANCE WHERE ID_TYPE_FINANCE='+IntToStr(id_type_finance);
   PKVInfo.Open;
   PKVInfo.FetchAll;
   if (PKVInfo.RecordCount>0)
   then begin
             cxButtonEdit2.Text:=PKVInfo.FieldByName('TYPE_FINANCE_NAME').AsString;
   end;
   PKVInfo.Close;
   PKVInfo.Free;

   if TfrmSmetaGroup(Owner).UseMO
   then begin
             {if mo_char=null
             then MOCharDataSet.SelectSQL.Text:='select * from BU_SM_GR_GET_MO_CHAR(NULL)'
             else MOCharDataSet.SelectSQL.Text:='select * from BU_SM_GR_GET_MO_CHAR('+''''+VarToStr(mo_char)+''''+')';
             MOCharDataSet.Database    :=TfrmSmetaGroup(Owner).WorkDatabase;
             MOCharDataSet.Transaction :=TfrmSmetaGroup(Owner).ReadTransaction;
             MOCharDataSet.Open;
             MOCharDataSet.FetchAll;}
             cxTextEdit1.Text:=VarToStr(MO_char);
             
    end;


   Label4.Visible:=TfrmSmetaGroup(Owner).UseMO;
   cxTextEdit1.Visible:=TfrmSmetaGroup(Owner).UseMO;
end;

procedure TfrmEditPKV.cxButton1Click(Sender: TObject);
begin
    Date_Beg:=StrToDate('01.'+IntToStr(cbMonthBeg.ItemIndex+1)+'.'+cbYearBeg.Properties.Items[cbYearBeg.ItemIndex]);
    Date_End:=IncMonth(StrToDate('01.'+IntToStr(cbMonthEnd.ItemIndex+1)+'.'+cbYearEnd.Properties.Items[cbYearEnd.ItemIndex]),1)-1;

    if (_checkMOparams)
    then begin
              if (date_beg<=date_end) and (cxButtonEdit1.Text<>'')
              then ModalResult:=mrYes
              else MessageBox(handle,Pchar('Некоректні данні'),Pchar(BU_ErrorCaption), MB_OK or MB_ICONWARNING);
    end
    else begin
              if (date_beg<=date_end) 
              then ModalResult:=mrYes
              else MessageBox(handle,Pchar('Некоректні данні'),Pchar(BU_ErrorCaption), MB_OK or MB_ICONWARNING);
    end;
end;

procedure TfrmEditPKV.cxButton2Click(Sender: TObject);
begin
     ModalResult:=mrNo;
end;

procedure TfrmEditPKV.cxButtonEdit1PropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var Res:Variant;
    PKVInfo:TpFibDataSet;
begin
    Res:= GlobalSpr.GetSmPKV(Self,TfrmSmetaGroup(Owner).WorkDatabase.Handle,fsNormal,0);
    if Res<>Variant(0)
    then begin
               id_sm_pkv:=VarAsType(Res,varInt64);
               PKVInfo:=TpFibDataSet.Create(self);
               PKVInfo.Database:=TfrmSmetaGroup(Owner).WorkDatabase;
               PKVInfo.Transaction:=TfrmSmetaGroup(Owner).ReadTransaction;
               PKVInfo.SelectSQL.Text:='SELECT * FROM PUB_SP_SM_PKV WHERE ID_PKV='+IntToStr(id_sm_pkv);
               PKVInfo.Open;
               PKVInfo.FetchAll;
               if (PKVInfo.RecordCount>0)
               then begin
                         cxButtonEdit1.Text:=PKVInfo.FieldByName('PKV_KOD').AsString;
               end;
               PKVInfo.Close;
               PKVInfo.Free;
    end;
end;

procedure TfrmEditPKV.cxButtonEdit2PropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var Res:Variant;
    PKVInfo:TpFibDataSet;
begin
    Res:=GlobalSpr.GetTypeFinance(self,TfrmSmetaGroup(Owner).WorkDatabase.Handle,fsNormal,0);
    if Res<>Variant(0)
    then begin
               id_type_finance:=VarAsType(Res,varInteger);
               PKVInfo:=TpFibDataSet.Create(self);
               PKVInfo.Database:=TfrmSmetaGroup(Owner).WorkDatabase;
               PKVInfo.Transaction:=TfrmSmetaGroup(Owner).ReadTransaction;
               PKVInfo.SelectSQL.Text:='SELECT * FROM PUB_SP_TYPE_FINANCE WHERE ID_TYPE_FINANCE='+IntToStr(id_type_finance);
               PKVInfo.Open;
               PKVInfo.FetchAll;
               if (PKVInfo.RecordCount>0)
               then begin
                         cxButtonEdit2.Text:=PKVInfo.FieldByName('TYPE_FINANCE_NAME').AsString;
               end;
               PKVInfo.Close;
               PKVInfo.Free;
    end;
end;

end.
