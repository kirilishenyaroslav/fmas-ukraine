{               "Учет товарно-материальных ценностей, ОС, МНА и МБП"           }
{                              Инвентарная картотека                           }
{                                                                              }
{               (c) Шамарин Ю.В., Данильченко А.Н.     2004-2007               }
{                                                                              }
unit uLookingHistory;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ibase, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxLookAndFeelPainters, StdCtrls,
  cxButtons, ExtCtrls, cxGridLevel, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  ImgList, cxClasses, FIBDatabase, pFIBDatabase, FIBDataSet, pFIBDataSet,
  cxCheckBox, cxSplitter, Placemnt, cxContainer, cxTextEdit, uResources,
  cxDBEdit, ActnList;

type
  TfmLookingHistory = class(TForm)
    cxStyleRepository1: TcxStyleRepository;
    cxStyle15: TcxStyle;
    cxStyle16: TcxStyle;
    cxStyle17: TcxStyle;
    cxStyle18: TcxStyle;
    cxStyle19: TcxStyle;
    cxStyle20: TcxStyle;
    cxStyle21: TcxStyle;
    cxStyle22: TcxStyle;
    cxStyle23: TcxStyle;
    cxStyle24: TcxStyle;
    cxStyle25: TcxStyle;
    cxStyle26: TcxStyle;
    cxStyle27: TcxStyle;
    cxStyle28: TcxStyle;
    cxStyleYellow: TcxStyle;
    cxStyleFontBlack: TcxStyle;
    cxStyleMalin: TcxStyle;
    cxStyleBorder: TcxStyle;
    cxStylemalinYellow: TcxStyle;
    cxStyleGrid: TcxStyle;
    ForHaeder: TcxStyle;
    AfterSelection: TcxStyle;
    cxGridTableViewStyleSheet1: TcxGridTableViewStyleSheet;
    ImageListButton: TImageList;
    Panel1: TPanel;
    cxButtonLookingEnd: TcxButton;
    pFIBDatabaselook: TpFIBDatabase;
    pFIBDataSetlook: TpFIBDataSet;
    pFIBTransactionRd: TpFIBTransaction;
    DataSourcelook: TDataSource;
    cxGridInvLooking: TcxGrid;
    cxGridInvLookingDBTableView1: TcxGridDBTableView;
    cxGridInvLookingDBTableView1DBColumn1: TcxGridDBColumn;
    cxGridInvLookingDBTableView1DBColumn8: TcxGridDBColumn;
    cxGridInvLookingDBTableView1DBColumn2: TcxGridDBColumn;
    cxGridInvLookingDBTableView1DBColumn6: TcxGridDBColumn;
    cxGridInvLookingDBTableView1DBColumn3: TcxGridDBColumn;
    cxGridInvLookingDBTableView1DBColumn4: TcxGridDBColumn;
    cxGridInvLookingLevel1: TcxGridLevel;
    Panel2: TPanel;
    cxSplitter1: TcxSplitter;
    FormStorage1: TFormStorage;
    cxTextEditizn: TcxTextEdit;
    cxTextEditout: TcxTextEdit;
    cxTextEditup: TcxTextEdit;
    cxTextEditexpl: TcxTextEdit;
    cxTextEditopr: TcxTextEdit;
    cxTextEditNum: TcxTextEdit;
    cxTextEdittip: TcxTextEdit;
    cxTextEditostpr: TcxTextEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    cxDBTextEdit1: TcxDBTextEdit;
    cxDBTextEdit2: TcxDBTextEdit;
    pFIBDataSetlookID_MO: TFIBBCDField;
    pFIBDataSetlookFIO_MOL: TFIBStringField;
    pFIBDataSetlookNAME_DEPARTMENT: TFIBStringField;
    pFIBDataSetlookNAME_KART: TFIBStringField;
    pFIBDataSetlookNAME_SCH: TFIBStringField;
    pFIBDataSetlookGRP_NUM: TFIBStringField;
    pFIBDataSetlookINV_NUM: TFIBStringField;
    pFIBDataSetlookNUM_SCH: TFIBStringField;
    pFIBDataSetlookBAL_PRICE: TFIBBCDField;
    pFIBDataSetlookOST_PRICE: TFIBBCDField;
    pFIBDataSetlookIZNOS: TFIBBCDField;
    pFIBDataSetlookR_ID_KART: TFIBBCDField;
    pFIBDataSetlookID_INV_GRP: TFIBBCDField;
    pFIBDataSetlookID_OST: TFIBBCDField;
    pFIBDataSetlookID_MANS: TFIBBCDField;
    pFIBDataSetlookID_NOMNS: TFIBBCDField;
    pFIBDataSetlookID_SCHS: TFIBBCDField;
    pFIBDataSetlookDOC_REC: TFIBDateField;
    pFIBDataSetlookWORKED: TFIBSmallIntField;
    pFIBDataSetlookTIP_KART: TFIBStringField;
    pFIBDataSetlookUSE_IN_NALOG: TFIBSmallIntField;
    pFIBDataSetlookKART_NUM: TFIBIntegerField;
    pFIBDataSetlookID_DB: TFIBBCDField;
    pFIBDataSetlookID_KR: TFIBBCDField;
    pFIBDataSetlookDATE_EXPL: TFIBDateField;
    pFIBDataSetlookDATE_OUT: TFIBDateField;
    pFIBDataSetlookDATE_OPR: TFIBDateField;
    pFIBDataSetlookDATE_UP: TFIBDateField;
    pFIBDataSetlookFULL_INV: TFIBStringField;
    pFIBDataSetlookIS_BUHG_ACC: TFIBSmallIntField;
    pFIBDataSetlookBAL_ID_SCH: TFIBBCDField;
    pFIBDataSetlookBAL_SCH_NUMBER: TFIBStringField;
    pFIBDataSetlookBAL_SCH_TITLE: TFIBStringField;
    pFIBDataSetlookCHEKER: TFIBIntegerField;
    pFIBDataSetlookIS_SKLAD: TFIBSmallIntField;
    pFIBDataSetlookTIME_STAMP: TFIBDateTimeField;
    pFIBDataSetlookUSER_ACTION: TFIBStringField;
    pFIBDataSetlookID_USER: TFIBBCDField;
    pFIBDataSetlookNAME_USER: TFIBStringField;
    ActionList1: TActionList;
    acExit: TAction;
    procedure cxButtonLookingEndClick(Sender: TObject);
    procedure pFIBDataSetlookAfterScroll(DataSet: TDataSet);
    procedure cxTextEdittipKeyPress(Sender: TObject; var Key: Char);
    procedure cxTextEditNumKeyPress(Sender: TObject; var Key: Char);
    procedure cxTextEditostprKeyPress(Sender: TObject; var Key: Char);
    procedure cxTextEditiznKeyPress(Sender: TObject; var Key: Char);
    procedure cxTextEditoprKeyPress(Sender: TObject; var Key: Char);
    procedure cxTextEditexplKeyPress(Sender: TObject; var Key: Char);
    procedure cxTextEditupKeyPress(Sender: TObject; var Key: Char);
    procedure cxTextEditoutKeyPress(Sender: TObject; var Key: Char);
    procedure cxGridInvLookingDBTableView1DBColumn1HeaderClick(
      Sender: TObject);
    procedure cxGridInvLookingDBTableView1DBColumn8HeaderClick(
      Sender: TObject);
    procedure cxGridInvLookingDBTableView1DBColumn2HeaderClick(
      Sender: TObject);
    procedure cxGridInvLookingDBTableView1DBColumn6HeaderClick(
      Sender: TObject);
    procedure cxGridInvLookingDBTableView1DBColumn3HeaderClick(
      Sender: TObject);
    procedure cxGridInvLookingDBTableView1DBColumn4HeaderClick(
      Sender: TObject);
    procedure acExitExecute(Sender: TObject);
  private
    long_pole : string;
          prap_flag, d : integer;
          zpt, zpt1 : string;
          id_kart_otbor : int64;
  public
    ResultArray : Variant;
  end;
     function Lookhistory(AOwner:TComponent; Dblook : TISC_DB_HANDLE;Id_kart :int64):Variant;
var
  fmLookingHistory: TfmLookingHistory;

implementation

{$R *.dfm}

function Lookhistory(AOwner:TComponent; Dblook : TISC_DB_HANDLE;Id_kart :int64):Variant;
var
 form : TfmLookingHistory;
begin
      form                                  := TfmLookingHistory.Create(AOwner);
      form.pFIBDatabaselook.Handle          := Dblook;
      form.id_kart_otbor                    := Id_kart;

      form.pFIBDataSetlook.close;
      form.pFIBDataSetlook.SQLs.SelectSQL.Text          := 'select * from MAT_INV_SEL_TO_GRID_HIST('+IntToStr(form.id_kart_otbor)+')';
      form.pFIBDataSetlook.Open;

      form.Caption                                       := MAT_INV_system_name + 'Перегляд iсторiї змiни картки'; 
      form.cxGridInvLookingDBTableView1DBColumn1.Caption := MAT_INV_SCH;
      form.cxGridInvLookingDBTableView1DBColumn8.Caption := MAT_INV_Inv_Num;
      form.cxGridInvLookingDBTableView1DBColumn2.Caption := MAT_INV_MOL;
      form.cxGridInvLookingDBTableView1DBColumn6.Caption := 'Пiдроздiл';
      form.cxGridInvLookingDBTableView1DBColumn3.Caption := MAT_INV_Name;
      form.cxGridInvLookingDBTableView1DBColumn4.Caption := MAT_INV_Bal_price;


      form.ShowModal;
      Lookhistory := form.ResultArray;
      form.Free;
end;

procedure TfmLookingHistory.cxButtonLookingEndClick(Sender: TObject);
begin
    close;
end;

procedure TfmLookingHistory.pFIBDataSetlookAfterScroll(DataSet: TDataSet);
var
    i : integer;
begin
    if (cxTextEdittip.Text           <> null) and
       (cxTextEditNum.Text           <> null) and
       (cxTextEditExpl.Text          <> null) and
       (cxTextEditOut.Text           <> null) and
       (cxTextEditUp.Text            <> null) and
       (cxTextEditostpr.Text         <> null) and
       (cxTextEditizn.Text           <> null) and
       (cxTextEditOpr.Text           <> null) then
    begin
        cxTextEdittip.Text           := pFIBDataSetlook.FieldByName('TIP_KART').AsString;
        cxTextEditNum.Text           := pFIBDataSetlook.FieldByName('KART_NUM').AsString;
        cxTextEditExpl.Text          := pFIBDataSetlook.FieldByName('DATE_EXPL').AsString;
        cxTextEditOut.Text           := pFIBDataSetlook.FieldByName('DATE_OUT').AsString;
        cxTextEditOpr.Text           := pFIBDataSetlook.FieldByName('DATE_OPR').AsString;
        cxTextEditUp.Text            := pFIBDataSetlook.FieldByName('DATE_UP').AsString;

        cxTextEditostpr.Text         := pFIBDataSetlook.FieldByName('OST_PRICE').AsString;
        cxTextEditizn.Text           := pFIBDataSetlook.FieldByName('IZNOS').AsString;

        //**********************************************************************
        prap_flag := 0;
        d         := 0;
        
        zpt := cxTextEditostpr.Text;
        zpt1 := zpt;
        long_pole:= IntToStr(cxTextEditostpr.GetTextLen);
        for i := 1 to StrToInt(long_pole) do
        begin
            if zpt[i] <> ',' then
            begin
                prap_flag := 1;
            end;
            if zpt[i] = ',' then
            begin
                prap_flag := 0;
                d:= 1;
            end;
            if zpt[StrToInt(long_pole)-1] = ',' then
            begin
                prap_flag := 0;
                if zpt[StrToInt(long_pole)] <> '0' then
                begin
                    d:= 2;
                end;
            end;
        end;
        if prap_flag = 1 then
            begin
                    zpt := zpt+',00';
                    cxTextEditostpr.Clear;
                    cxTextEditostpr.Text :=zpt;
                    prap_flag := 0;
            end;

        if (d = 1) and (prap_flag = 0) then
            begin
                cxTextEditostpr.Clear;
                cxTextEditostpr.Text :=zpt1;
            end;
        if (d = 2) and (prap_flag = 0) then
            begin
                cxTextEditostpr.Clear;
                cxTextEditostpr.Text :=zpt1+'0';
                d := 0;
            end;
        //**********************************************************************

//**********************************************************************
        prap_flag := 0;
        d         := 0;
        
        zpt := cxTextEditizn.Text;
        zpt1 := zpt;
        long_pole:= IntToStr(cxTextEditizn.GetTextLen);
        for i := 1 to StrToInt(long_pole) do
        begin
            if zpt[i] <> ',' then
            begin
                prap_flag := 1;
            end;
            if zpt[i] = ',' then
            begin
                prap_flag := 0;
                d:= 1;
            end;
            if zpt[StrToInt(long_pole)-1] = ',' then
            begin
                prap_flag := 0;
                if zpt[StrToInt(long_pole)] <> '0' then
                begin
                    d:= 2;
                end;
            end;
        end;
        if prap_flag = 1 then
            begin
                    zpt := zpt+',00';
                    cxTextEditizn.Clear;
                    cxTextEditizn.Text :=zpt;
                    prap_flag := 0;
            end;

        if (d = 1) and (prap_flag = 0) then
            begin
                cxTextEditizn.Clear;
                cxTextEditizn.Text :=zpt1;
            end;
        if (d = 2) and (prap_flag = 0) then
            begin
                cxTextEditizn.Clear;
                cxTextEditizn.Text :=zpt1+'0';
                d := 0;
            end;
        //**********************************************************************
    end;
end;

procedure TfmLookingHistory.cxTextEdittipKeyPress(Sender: TObject;
  var Key: Char);
begin
    Key := Chr(0);
end;

procedure TfmLookingHistory.cxTextEditNumKeyPress(Sender: TObject;
  var Key: Char);
begin
    Key := Chr(0);
end;

procedure TfmLookingHistory.cxTextEditostprKeyPress(Sender: TObject;
  var Key: Char);
begin
    Key := Chr(0);
end;

procedure TfmLookingHistory.cxTextEditiznKeyPress(Sender: TObject;
  var Key: Char);
begin
    Key := Chr(0);
end;

procedure TfmLookingHistory.cxTextEditoprKeyPress(Sender: TObject;
  var Key: Char);
begin
    Key := Chr(0);
end;

procedure TfmLookingHistory.cxTextEditexplKeyPress(Sender: TObject;
  var Key: Char);
begin
    Key := Chr(0);
end;

procedure TfmLookingHistory.cxTextEditupKeyPress(Sender: TObject;
  var Key: Char);
begin
    Key := Chr(0);
end;

procedure TfmLookingHistory.cxTextEditoutKeyPress(Sender: TObject;
  var Key: Char);
begin
    Key := Chr(0);
end;

procedure TfmLookingHistory.cxGridInvLookingDBTableView1DBColumn1HeaderClick(
  Sender: TObject);
begin
    cxGridInvLookingDBTableView1.OptionsBehavior.IncSearchItem:=cxGridInvLookingDBTableView1DBColumn1;
end;

procedure TfmLookingHistory.cxGridInvLookingDBTableView1DBColumn8HeaderClick(
  Sender: TObject);
begin
    cxGridInvLookingDBTableView1.OptionsBehavior.IncSearchItem:=cxGridInvLookingDBTableView1DBColumn8;
end;

procedure TfmLookingHistory.cxGridInvLookingDBTableView1DBColumn2HeaderClick(
  Sender: TObject);
begin
    cxGridInvLookingDBTableView1.OptionsBehavior.IncSearchItem:=cxGridInvLookingDBTableView1DBColumn2;
end;

procedure TfmLookingHistory.cxGridInvLookingDBTableView1DBColumn6HeaderClick(
  Sender: TObject);
begin
    cxGridInvLookingDBTableView1.OptionsBehavior.IncSearchItem:=cxGridInvLookingDBTableView1DBColumn6;
end;

procedure TfmLookingHistory.cxGridInvLookingDBTableView1DBColumn3HeaderClick(
  Sender: TObject);
begin
    cxGridInvLookingDBTableView1.OptionsBehavior.IncSearchItem:=cxGridInvLookingDBTableView1DBColumn3;
end;

procedure TfmLookingHistory.cxGridInvLookingDBTableView1DBColumn4HeaderClick(
  Sender: TObject);
begin
    cxGridInvLookingDBTableView1.OptionsBehavior.IncSearchItem:=cxGridInvLookingDBTableView1DBColumn4;
end;

procedure TfmLookingHistory.acExitExecute(Sender: TObject);
begin
  Close;
end;

end.
