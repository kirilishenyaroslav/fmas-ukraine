unit EditWorkSubsOtdelPeople;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls,IBase, FIBDatabase, pFIBDatabase,StudcityConst,
  cxLookAndFeelPainters, StdCtrls, cxButtons, DB, FIBDataSet, pFIBDataSet,
  cxControls, cxContainer, cxEdit, cxLabel, cxTextEdit, cxMemo,St_Loader_Unit,
  ActnList,St_ser_function;

type
  TfrmEditWorkSubsOtdelPeople = class(TForm)
    StatusBar1: TStatusBar;
    Database: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    cxButtonFind: TcxButton;
    cxButtonEnter: TcxButton;
    cxButtonClose: TcxButton;
    cxLabel1: TcxLabel;
    cxLabelFIOSubs: TcxLabel;
    pFIBDataSetGetPeople: TpFIBDataSet;
    pFIBDataSetCorrect: TpFIBDataSet;
    cxLabel2: TcxLabel;
    cxLabelFIO: TcxLabel;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    cxLabelSumma: TcxLabel;
    ActionList: TActionList;
    Find: TAction;
    cxLabelFAK: TcxLabel;
    OK: TAction;
    pFIBDataSetGetFak: TpFIBDataSet;
    procedure cxButtonCloseClick(Sender: TObject);
    procedure cxButtonFindClick(Sender: TObject);
    procedure cxButtonEnterClick(Sender: TObject);
    procedure FindExecute(Sender: TObject);
    procedure OKExecute(Sender: TObject);
  private

    { Private declarations }
  public
    constructor Create (Aowner:TComponent;ID_KEY:Int64;DB:TISC_DB_HANDLE);overload;
    function Get():Int64;
    { Public declarations }
  end;

var
  frmEditWorkSubsOtdelPeople: TfrmEditWorkSubsOtdelPeople;
  id_key_record:Int64;
  ResultVal:Int64;
  Lang:Integer;
implementation

{$R *.dfm}
constructor  TfrmEditWorkSubsOtdelPeople.Create (Aowner:TComponent;ID_KEY:Int64;DB:TISC_DB_HANDLE);
begin
  Inherited Create(Aowner);
  Database.Handle:=DB;
  id_key_record:=ID_KEY;
  ResultVal:=0;

  Lang:=ST_serLanguageIndex(DB);

  caption:=StudcityConst.Studcity_WorkListEditEnter_EX[lang];
  cxButtonFind.Caption:=StudcityConst.Studcity_WorkListEditNewFind_EX[lang]+'(F7)';
  cxButtonEnter.Caption:=StudcityConst.Studcity_WorkListEditOk_EX[lang]+'(F10)';
  cxButtonClose.Caption:=StudcityConst.Studcity_ACTION_CLOSE_CONST_EX[lang];

  pFIBDataSetGetPeople.Active:=false;
  pFIBDataSetGetPeople.Database:=Database;
  pFIBDataSetGetPeople.Transaction:=ReadTransaction;
  pFIBDataSetGetPeople.ParamByName('PARAM_KEY').AsInt64:=id_key_record;
  pFIBDataSetGetPeople.Active:=true;

  pFIBDataSetCorrect.Active:=false;
  pFIBDataSetCorrect.Database:=Database;
  pFIBDataSetCorrect.Transaction:=ReadTransaction;
  pFIBDataSetCorrect.ParamByName('param_act').AsString:=pFIBDataSetGetPeople.FieldByName('NUMB').AsString;
  pFIBDataSetCorrect.Active:=true;
  pFIBDataSetCorrect.FetchAll;

  cxLabel1.Caption:=StudcityConst.Studcity_WorkListConnect_EX[lang];
  cxLabelFIOSubs.Caption:=pFIBDataSetGetPeople.FieldByName('FIO').AsString;
  cxLabel2.Caption:=StudcityConst.Studcity_ReportsBegin_EX[lang];
  if pFIBDataSetCorrect.RecordCount=1 then
    begin
      cxLabelFIO.Caption:=pFIBDataSetCorrect.FieldByName('familia').AsString+' '+pFIBDataSetCorrect.FieldByName('imya').AsString+' '+pFIBDataSetCorrect.FieldByName('otchestvo').AsString;
      cxlabelFak.Caption:=pFIBDataSetCorrect.FieldByName('name_short').AsString;
      cxLabelFIO.Style.Font.Color:=clBlack;
    end
    else
    begin
      cxLabelFIO.Caption:='___________________________';
      cxlabelFak.Caption:='';
      cxLabelFIO.Style.Font.Color:=clRed;
    end;
  cxLabel3.Caption:=StudcityConst.Studcity_WorkListPeriodSubs_EX[lang]+' '+StudcityConst.Studcity_ReportsBegin_EX[lang]+' '+pFIBDataSetGetPeople.FieldByName('DAT1').AsString+' '+
                    StudcityConst.Studcity_ReportsEnd_EX[lang]+' '+pFIBDataSetGetPeople.FieldByName('DAT2').AsString;
  cxLabel4.Caption:=StudcityConst.Studcity_WorkListSummaSubs_EX[lang];
  cxLabelSumma.Caption:=VarToStr(pFIBDataSetGetPeople.FieldByName('SUMMA').AsVariant);
end;

function TfrmEditWorkSubsOtdelPeople.Get():Int64;
var
  res:variant;
begin
  ShowModal;
  get:=ResultVal;
  free;
end;


procedure TfrmEditWorkSubsOtdelPeople.cxButtonCloseClick(Sender: TObject);
begin
  ResultVal:=-1;
  Close;
end;

procedure TfrmEditWorkSubsOtdelPeople.cxButtonFindClick(Sender: TObject);
var
  id_people_array:Variant;
begin
id_people_array:=St_Loader_Unit.Load_Reestr(self,Database.Handle);
if VarArrayDimCount(id_people_array)>0 then
  begin
    cxLabelFIO.Caption:=id_people_array[1]+' '+id_people_array[2]+' '+id_people_array[3];

    ResultVal:=id_people_array[0];

    pFIBDataSetGetFak.Active:=false;
    pFIBDataSetGetFak.ParamByName('param_people').AsInt64:=ResultVal;
    pFIBDataSetGetFak.Active:=true;
    cxlabelFak.Caption:=pFIBDataSetGetFak.FieldByName('name_short').AsString;

  end;
end;

procedure TfrmEditWorkSubsOtdelPeople.cxButtonEnterClick(Sender: TObject);
begin
if (pFIBDataSetCorrect.RecordCount=1)  and (ResultVal=0) then
  begin
    ResultVal:=pFIBDataSetCorrect.FieldByName('ID_KOD').asvariant;
    Close;
  end
  else
  begin
    if (ResultVal<>0) then
      begin
        close;
      end
  end

end;

procedure TfrmEditWorkSubsOtdelPeople.FindExecute(Sender: TObject);
begin
  cxButtonFindClick(self);
end;

procedure TfrmEditWorkSubsOtdelPeople.OKExecute(Sender: TObject);
begin
  cxButtonEnterClick(self)
end;

end.
