unit uEditSmetaPeriod;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Resources_unitb, GlobalSpr,
  cxLookAndFeelPainters, cxButtons, ExtCtrls, cxControls, cxContainer,
  cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxStyles, cxCustomData,
  cxGraphics, cxFilter, cxData, cxDataStorage, DB, cxDBData, cxCheckBox,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, cxGridCustomView, cxGrid, FIBDataSet, pFIBDataSet,
  cxButtonEdit;

type
  TfrmSetSmetaPeriod = class(TForm)
    Panel1: TPanel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    cbMonthBeg: TComboBox;
    cbMonthEnd: TComboBox;
    cbYearEnd: TComboBox;
    cbYearBeg: TComboBox;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    GroupDataSet: TpFIBDataSet;
    cxStyleRepository1: TcxStyleRepository;
    back: TcxStyle;
    column_gray: TcxStyle;
    periods: TcxStyle;
    GroupDataSource: TDataSource;
    cxButtonEdit1: TcxButtonEdit;
    IsDraft: TcxCheckBox;
    Label6: TLabel;
    Note: TcxTextEdit;
    CloneBeforeStructure: TcxCheckBox;
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cxButtonEdit1PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private
      edit_flag:boolean;
  public
    Curr_Date:TDateTime;
    date_beg:TdateTime;
    date_end:TdateTime;
    in_date_beg:TdateTime;
    in_date_end:TdateTime;
    id_sm_group:integer;
    sm_group_text:string;
    constructor Create(AOwner:TComponent;DateBeg,DateEnd:TDateTime;IdSmGr:Int64;EditFlag:Boolean);reintroduce;
  end;


implementation
uses DateUtils, USprSmeta;

{$R *.dfm}

procedure TfrmSetSmetaPeriod.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
     Resize:=false;
end;

procedure TfrmSetSmetaPeriod.cxButton1Click(Sender: TObject);
begin

     DateSeparator:='.';
     date_beg:=StrToDate('01.'+IntToStr(cbMonthbeg.ItemIndex+1)+'.'+cbYearbeg.Items[cbYearbeg.ItemIndex]);

     if (cbMonthend.ItemIndex+1<=11)
     then begin
          date_end:=StrToDate('01.'+IntToStr(cbMonthend.ItemIndex+2)+'.'+cbYearend.Items[cbYearend.ItemIndex]);
          date_end:=date_end-1;
     end
     else begin
          date_end:=StrToDate('01.01.'+cbYearend.Items[cbYearend.ItemIndex+1]);
          date_end:=date_end-1;
     end;



     if (date_beg<=date_end) and (cxButtonEdit1.Text<>'')
                           then ModalResult:=mrYes
                           else MessageBox(handle,Pchar('Некоректні данні'),Pchar(BU_ErrorCaption), MB_OK or MB_ICONWARNING);

end;

procedure TfrmSetSmetaPeriod.cxButton2Click(Sender: TObject);
begin
     ModalResult:=mrNo;
end;

procedure TfrmSetSmetaPeriod.FormCreate(Sender: TObject);
var GetSysInfo:TpFibDataSet;
begin
    GroupDataSet.Database:=TfrmSmetaSpr(Owner).WorkDatabase;
    GroupDataSet.Transaction :=TfrmSmetaSpr(Owner).ReadTransaction;
    GroupDataSet.Open;

    GetSysInfo:=TpFibDataSet.Create(self);
    GetSysInfo.Database:=TfrmSmetaSpr(Owner).WorkDatabase;
    GetSysInfo.Transaction:=TfrmSmetaSpr(Owner).ReadTransaction;
    GetSysInfo.SelectSQL.Text:='SELECT USE_DRAFTS FROM BU_INI';
    GetSysInfo.Open;
    if (GetSysInfo.RecordCount>0)
    then begin
              if GetSysInfo.FieldByName('USE_DRAFTS').Value=1
              then begin
                        IsDraft.Visible:=True;
              end
    end;
    GetSysInfo.Close;
    GetSysInfo.Free;


end;

procedure TfrmSetSmetaPeriod.cxButtonEdit1PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var Res:Variant;
begin
    Res:=GlobalSpr.GetSmGrp(self,TfrmSmetaSpr(Owner).WorkDatabase.Handle,fsNormal,0,TfrmSmetaSpr(Owner).id_user);
    if VarArrayDimCount(Res)>0
    then begin
               id_sm_group       :=Res[0];
               sm_group_text     :=VarToStr(Res[1]);
               cxButtonEdit1.Text:=sm_group_text;
    end;
end;

constructor TfrmSetSmetaPeriod.Create(AOwner: TComponent; DateBeg, DateEnd: TDateTime; IdSmGr: Int64;EditFlag:Boolean);
     var i:Integer;
begin
       inherited Create(AOwner);
       self.in_date_beg:=DateBeg;
       self.in_date_end:=DateEnd;
       self.edit_flag  :=EditFlag;
       self.id_sm_group:=IdSmGr;
       self.Curr_Date:=DateBeg;

       cbMonthBeg.Items.Add(TRIM(BU_Month_01));
       cbMonthBeg.Items.Add(TRIM(BU_Month_02));
       cbMonthBeg.Items.Add(TRIM(BU_Month_03));
       cbMonthBeg.Items.Add(TRIM(BU_Month_04));
       cbMonthBeg.Items.Add(TRIM(BU_Month_05));
       cbMonthBeg.Items.Add(TRIM(BU_Month_06));
       cbMonthBeg.Items.Add(TRIM(BU_Month_07));
       cbMonthBeg.Items.Add(TRIM(BU_Month_08));
       cbMonthBeg.Items.Add(TRIM(BU_Month_09));
       cbMonthBeg.Items.Add(TRIM(BU_Month_10));
       cbMonthBeg.Items.Add(TRIM(BU_Month_11));
       cbMonthBeg.Items.Add(TRIM(BU_Month_12));

       cbMonthEnd.Items.Add(TRIM(BU_Month_01));
       cbMonthEnd.Items.Add(TRIM(BU_Month_02));
       cbMonthEnd.Items.Add(TRIM(BU_Month_03));
       cbMonthEnd.Items.Add(TRIM(BU_Month_04));
       cbMonthEnd.Items.Add(TRIM(BU_Month_05));
       cbMonthEnd.Items.Add(TRIM(BU_Month_06));
       cbMonthEnd.Items.Add(TRIM(BU_Month_07));
       cbMonthEnd.Items.Add(TRIM(BU_Month_08));
       cbMonthEnd.Items.Add(TRIM(BU_Month_09));
       cbMonthEnd.Items.Add(TRIM(BU_Month_10));
       cbMonthEnd.Items.Add(TRIM(BU_Month_11));
       cbMonthEnd.Items.Add(TRIM(BU_Month_12));

       for i:=0 to YEARS_COUNT do
       begin
          cbYearBeg.Items.Add(TRIM(IntToStr(BASE_YEAR+i)));
          cbYearEnd.Items.Add(TRIM(IntToStr(BASE_YEAR+i)));
       end;

       if edit_flag
       then begin
                 cbMonthbeg.ItemIndex:=MonthOf(in_date_beg)-1;
                 for i:=0 to cbYearBeg.Items.Count-1 do
                 begin
                     if pos(cbYearBeg.Items[i],IntToStr(YearOf(in_date_beg)))>0
                     then begin
                        cbYearBeg.ItemIndex:=i;
                        break;
                     end;
                 end;
                 cbMonthend.ItemIndex:=MonthOf(in_date_end)-1;
                 for i:=0 to cbYearend.Items.Count-1 do
                 begin
                     if pos(cbYearend.Items[i],IntToStr(YearOf(in_date_end)))>0
                     then begin
                        cbYearend.ItemIndex:=i;
                        break;
                     end;
                 end;

    end
    else begin
                 cbMonthbeg.ItemIndex:=MonthOf(Curr_Date)-1;
                 cbMonthend.ItemIndex:=cbMonthbeg.ItemIndex;
                 for i:=0 to cbYearBeg.Items.Count-1 do
                 begin
                     if pos(cbYearBeg.Items[i],IntToStr(YearOf(Curr_Date)))>0
                     then begin
                        cbYearBeg.ItemIndex:=i;
                        cbYearEnd.ItemIndex:=i;
                        break;
                     end;
                 end;
    end;

end;

end.
