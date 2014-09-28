unit BankSchSelectAnalyz;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxLookAndFeelPainters, ImgList,
  ActnList, RxMemDS, FIBDatabase, pFIBDatabase, FIBDataSet, pFIBDataSet,
  cxGridTableView, StdCtrls, cxButtons, ExtCtrls, cxGridLevel,
  cxGridCustomTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, filterAnalyzEr, Un_R_file_Alex, Placemnt;

type
  TfrmbankSchSelectAnalyz = class(TForm)
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1DBColumn1: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn2: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    Panel1: TPanel;
    cxButton2: TcxButton;
    cxButton1: TcxButton;
    StyleRepository: TcxStyleRepository;
    cxStyle4: TcxStyle;
    cxStyle5: TcxStyle;
    cxStyle6: TcxStyle;
    cxStyle7: TcxStyle;
    cxStyle8: TcxStyle;
    cxStyle9: TcxStyle;
    cxStyle10: TcxStyle;
    cxStyle11: TcxStyle;
    cxStyle12: TcxStyle;
    cxStyle13: TcxStyle;
    cxStyle14: TcxStyle;
    cxStyle15: TcxStyle;
    cxStyle16: TcxStyle;
    cxStyle17: TcxStyle;
    cxStyleYellow: TcxStyle;
    cxStyleFontBlack: TcxStyle;
    cxStyleMalin: TcxStyle;
    cxStyleBorder: TcxStyle;
    cxStylemalinYellow: TcxStyle;
    cxStyleGrid: TcxStyle;
    GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet;
    pFIBDataSet1: TpFIBDataSet;
    pFIBDataSet1ID_SCH: TFIBBCDField;
    pFIBDataSet1DATE_BEG: TFIBDateField;
    pFIBDataSet1DATE_END: TFIBDateField;
    pFIBDataSet1SCH_TITLE: TFIBStringField;
    pFIBDataSet1SCH_NUM: TFIBStringField;
    pFIBDataSet1ID_RAS: TFIBBCDField;
    DataSource1: TDataSource;
    pFIBDatabase1: TpFIBDatabase;
    pFIBTransaction1: TpFIBTransaction;
    RxMemoryData1: TRxMemoryData;
    ActionList1: TActionList;
    ActionClose: TAction;
    ActionSel: TAction;
    ImageList1: TImageList;
    FormStorage1: TFormStorage;
    procedure ActionSelExecute(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure LoadCaption;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
        myform : TfrmFilterAnalizEr;
  public
    { Public declarations }
  end;

{var
  frmbankSchSelectAnalyz: TfrmbankSchSelectAnalyz; }

function ShowSchBank(Owner : TComponent; m : TfrmFilterAnalizEr; var Res : Variant) : boolean;

implementation
uses accMgmt;

{$R *.dfm}

function ShowSchBank(Owner : TComponent; m : TfrmFilterAnalizEr; var Res : Variant) : boolean;
var
    T : TfrmbankSchSelectAnalyz;
    i : integer;
    id : int64;
    number : string;
begin
    T := TfrmbankSchSelectAnalyz.Create(nil);
//    T.ShowModal;
    T.LoadCaption;
    T.myform                           := m;
    T.pFIBDatabase1                    := m.database;
    T.pFIBTransaction1.DefaultDatabase := T.pFIBDatabase1;
    T.pFIBDataSet1.Database            := T.pFIBDatabase1;
    T.pFIBDataSet1.Transaction         := T.pFIBTransaction1;
    T.pFIBDataSet1.Close;
    T.pFIBDataSet1.Open;
    T.pFIBDataSet1.First;
    while not T.pFIBDataSet1.Eof do
    begin
        if fibCheckPermission('/ROOT/Bank/Work/Work_with_RS/Bank_RS','Belong') = 0 then
        begin
            T.RxMemoryData1.Open;
            T.RxMemoryData1.Insert;
            T.RxMemoryData1.FieldByName('id').Value     := StrToInt64(T.pFIBDataSet1.FBN('ID_SCH').ASString);
            T.RxMemoryData1.FieldByName('number').Value := T.pFIBDataSet1.fbn('SCH_NUM').AsString;
            T.RxMemoryData1.FieldByName('title').Value  := T.pFIBDataSet1.fbn('SCH_TITLE').AsString;
            T.RxMemoryData1.Post;
        end else
        if fibCheckPermission('/ROOT/Bank/Work/Work_with_RS/Bank_RS/J2_'+T.pFIBDataSet1.fieldByName('ID_SCH').AsString,'Belong') = 0 then
        begin
            T.RxMemoryData1.Open;
            T.RxMemoryData1.Insert;
            T.RxMemoryData1.FieldByName('id').Value     := StrToInt64(T.pFIBDataSet1.FBN('ID_SCH').ASString);
            T.RxMemoryData1.FieldByName('number').Value := T.pFIBDataSet1.fbn('SCH_NUM').AsString;
            T.RxMemoryData1.FieldByName('title').Value  := T.pFIBDataSet1.fbn('SCH_TITLE').AsString;
            T.RxMemoryData1.Post;
        end;

        T.pFIBDataSet1.Next;
    end;



    if T.ShowModal = mrOk then
    begin
        Res := VarArrayCreate([0, T.cxGrid1DBTableView1.dataController.GetSelectedCount-1],varVariant);
        For i := 0 to T.cxGrid1DBTableView1.dataController.GetSelectedCount-1 do
        begin
           id     := T.cxGrid1DBTableView1.DataController.GetRecordId(T.cxGrid1DBTableView1.Controller.SelectedRecords[i].RecordIndex);
           T.RxMemoryData1.Locate('ID', id , []);
           number := T.RxMemoryData1.FieldByName('number').AsString;
           Res[i]:=VarArrayOf([id, number]);
        end;
        Result  := true;
    end
    else
        Result  := false;
    T.Free;
end;

procedure TfrmbankSchSelectAnalyz.ActionSelExecute(Sender: TObject);
begin
     ModalResult := mrOK;
end;

procedure TfrmbankSchSelectAnalyz.cxButton2Click(Sender: TObject);
begin
     close;
end;

procedure TfrmbankSchSelectAnalyz.LoadCaption;
begin
    cxGrid1DBTableView1DBColumn1.Caption := Un_R_file_Alex.KASSA_CLOSE_NUMBER_SCH;
    cxGrid1DBTableView1DBColumn2.Caption := Un_R_file_Alex.KASSA_CLOSE_NAME_SCH;
    Caption                              := Un_R_file_Alex.KASSA_FIND_CAPTION_SCH;
    ActionClose.Caption                  := Un_R_file_Alex.CLOSE_CONST[1];
    ActionSel.Caption                    := Un_R_file_Alex.CHOOSE_CONST[1];
end;

procedure TfrmbankSchSelectAnalyz.FormCreate(Sender: TObject);
begin
    FormStorage1.RestoreFormPlacement;
end;

procedure TfrmbankSchSelectAnalyz.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    FormStorage1.SaveFormPlacement;
end;

end.
