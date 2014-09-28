unit load;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxButtonEdit, cxGroupBox, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxGridCustomTableView, cxGridTableView,
  cxClasses, cxGridCustomView, cxGridLevel, cxGrid, Buttons, ExtCtrls,
  cxDropDownEdit, cxCalendar, cxLookAndFeelPainters, cxButtons,
  cxCurrencyEdit, FIBDatabase, pFIBDatabase, IBAse, FIBQuery, pFIBQuery,
  cxMemo, pFIBStoredProc, globalspr, LoadDogManedger, DB, FIBDataSet,
  pFIBDataSet, dxBar, ActnList, cxTL, dogLoaderUnit, Mask, ToolEdit,
  CurrEdit,uCommonSp, cxRadioGroup,AArray,LoaderUnit, Menus,
  cxCheckBox;

type
  TPeriodRecord = packed record
   _Per_State : string;
   _id_Period : integer;
   _Date_Beg  : TDate;
   _Date_End  : TDate;
   _Sum       : extended;
  end;

  TSmetaRecord = packed record
   _id_Period : integer;
   _SmetState : string;
   _kod_S     : variant;
   _kod_R     : variant;
   _kod_St    : variant;
   _kod_Kekv  : variant;
   _Sum       : extended;
   _S_Name    : variant;
   _R_Name    : variant;
   _St_Name   : variant;
   _Kekv_Name : variant;
   _id_S      : variant;
   _id_R      : variant;
   _id_St     : variant;
   _id_Kekv   : variant;
  end;

  TDelSmetsRecord = packed record
   _id_Period : integer;
   _id_S      : integer;
   _id_R      : integer;
   _id_St     : integer;
   _id_Kekv   : integer;
  end;

  TPeriodDataArray = array of TSmetaRecord;
  TPeriodArray = array of TPeriodRecord;

  TArnd_Contract_Add_Form = class(TForm)
    pFIBQuery1: TpFIBQuery;
  private
    fProc : TResProc;
    { Private declarations }
  public
    id_otdel       : integer;
    Priznak_Vizova : string;
    id_Document    : int64;

    id_arnd_type : integer;
    id_Tip_Dog  : integer;
    id_Customer : Int64;
    id_Rate_Acc : Int64;
    rate_acc_un : Int64;
    PeriodData  : TPeriodDataArray;
    DelPeriods  : array of integer;
    DelSmets    : array of TDelSmetsRecord;
    constructor Create(AOwner:TComponent; DBHandle : TISC_DB_HANDLE; frmStyle : TFormStyle; id_dokument: Variant;
         Pr_vizova: String; Id_t_d: Variant); overload;
  end;


function LoadShablon(AOwner: TComponent; DBHandle : TISC_DB_HANDLE; frmStyle : TFormStyle; id_dokument: Variant;
         Pr_vizova: String; Id_t_d: Variant; proc : TResProc; data : PShablonInputData = nil):variant;stdcall;
exports LoadShablon;

var
  Arnd_Contract_Add_Form: TArnd_Contract_Add_Form;
//  frmFavour: TfrmFavour;


implementation

//uses Period_Add, Arnd_Dog_Hist, DateUtils, Math, Registry, sp_Inflation;

uses DateUtils, Math, Registry;

{$R *.dfm}

function LoadShablon(AOwner: TComponent; DBHandle : TISC_DB_HANDLE; frmStyle : TFormStyle; id_dokument: Variant;
         Pr_vizova: String; Id_t_d: Variant; proc : TResProc; data : PShablonInputData = nil):variant;stdcall;
var
 upd_arnd:string;
 pFIBQuery1:TFIBQuery;
 pFIBDb : TFIBDatabase;
 pFibTr : TFIBTransaction;
 arnd_chck:integer;
 begin

 pFIBDb := TFIBDatabase.Create(AOwner);
 pFIBQuery1:=TFIBQuery.Create(AOwner);
 pFibTr:= TFIBTransaction.Create(AOwner);
 pFIBDb.Handle := DBHandle;
 pFIBDb.DefaultTransaction := pFibTr;
 pFIBDb.DefaultUpdateTransaction := pFibTr;
 pFIBQuery1.Database := pFIBDb;
 pFIBQuery1.Transaction := pFibTr;
 pFIBQuery1.Transaction.StartTransaction;

 pFIBQuery1.Close;
 pFIBQuery1.SQL.Clear;
 pFIBQuery1.SQL.Add('SELECT NATURAL_ARND FROM DOG_SYS_OPTIONS;');
 pFIBQuery1.ExecQuery;
 arnd_chck:= pFIBQuery1.FldByName['NATURAL_ARND'].AsInteger;

 if (arnd_chck = 1) then
 begin
  upd_arnd :='add_arnd_favour.bpl';
 end
 else begin
  upd_arnd := 'add_arnd_contract_sh.bpl';
 end;

 if Pr_vizova = 'SprFav' then
 begin
   LoadDogManedger.LoadShablon(AOwner, DBHandle, fsMDIChild,0, 'SprFav', 0, PChar('add_arnd_favour.bpl'),proc);
 end
 else
   LoadDogManedger.LoadShablon(AOwner, DBHandle, fsMDIChild, id_dokument, Pr_vizova, Id_t_d, PChar(upd_arnd), proc);

end;

constructor TArnd_Contract_Add_Form.Create(AOwner: TComponent;
  DBHandle: TISC_DB_HANDLE; frmStyle: TFormStyle; id_dokument: Variant;
  Pr_vizova: String; Id_t_d: Variant);
begin
 inherited Create (Aowner);
end;
end.
