unit MultySmetaSimpleReestr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ToolWin, ImgList, cxStyles, cxCustomData,
  cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData,
  cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  ExtCtrls, Ibase,  FIBDatabase, pFIBDatabase, FIBDataSet,
  pFIBDataSet, cxContainer, cxTextEdit, cxDBEdit,
  ActnList, Placemnt, dxStatusBar, FindSmetaSimpleReestr, cxCheckBox, RxMemDS, cxCalc,
  cxGridBandedTableView;



type
  TFpub_spr_smet = class(TForm)
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    ViewButton: TToolButton;
    SmallImages: TImageList;
    WorkDatabase: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    SearchDataSet: TpFIBDataSet;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton1: TToolButton;
    ActionList1: TActionList;
    Action1: TAction;
    Action3: TAction;
    dxStatusBar1: TdxStatusBar;
    Action2: TAction;
    Action4: TAction;
    SmetaDataSet: TpFIBDataSet;
    DataSource1: TDataSource;
    RxMemoryData1: TRxMemoryData;
    ToolButton2: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    cxGrid2: TcxGrid;
    smview: TcxGridDBTableView;
    smviewDBColumn3: TcxGridDBColumn;
    smViewDBColumn1: TcxGridDBColumn;
    smViewDBColumn2: TcxGridDBColumn;
    cxGrid2Level1: TcxGridLevel;
    Action5: TAction;
    Styles: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
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
    cxStyle29: TcxStyle;
    cxStyle30: TcxStyle;
    cxStyle31: TcxStyle;
    GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet;
    GridBandedTableViewStyleSheetDevExpress: TcxGridBandedTableViewStyleSheet;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ToolButton3Click(Sender: TObject);
    procedure cxGrid3DBTableView1FocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure ViewButtonClick(Sender: TObject);
    procedure ToolButton4Click(Sender: TObject);
    procedure SmViewKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxGrid3DBTableView1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxGrid4DBTableView1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxGrid3DBTableView1DblClick(Sender: TObject);
    procedure cxGrid4DBTableView1DblClick(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure Action3Execute(Sender: TObject);
    procedure SmetaDataSetCalcFields(DataSet: TDataSet);
    procedure ToolButton6Click(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure ToolButton5Click(Sender: TObject);
    procedure smviewMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
    p_id_sm:integer;
    p_id_rz:integer;
    p_id_st:integer;
    p_need:boolean;
  public
    { Public declarations }
    T: TfrmGetPosForm;

    ActualDate:TdateTime;
    ActualDate_str:string;
    ResultValue:Variant;
    ResultDataSet:TDataSet;
    function CheckChValues:Boolean;
    constructor Create(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE;Kod_Setup:integer;id_session:Integer;id_vidopl_prop:Integer); overload;
  end;


  function GetSmetsMulty(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE;Kod_Setup:integer;id_session:integer;id_vidopl_prop:Integer):TDataSet;stdcall;


implementation

uses VarUtils;


{$R *.dfm}

function GetPackVersion:Integer;
begin
     GetPackVersion:=1;
end;



function GetSmetsMulty(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE; Kod_Setup:integer;id_session:integer;id_vidopl_prop:Integer):TDataSet;
var T:TFpub_spr_smet;
    Res:TDataSet;
begin
     T:=TFpub_spr_smet.Create(AOwner,DBHANDLE,Kod_Setup,id_session,id_vidopl_prop);
     T.ShowModal;
     Res:=T.ResultDataSet;
     T.Free;
     GetSmetsMulty:=Res;
end;




constructor TFpub_spr_smet.Create(AOwner: TComponent; DBHANDLE: TISC_DB_HANDLE; Kod_Setup:integer; id_session:Integer; id_vidopl_prop:Integer);
begin
      inherited Create(AOwner);


      self.p_need:=false;
      Self.WorkDatabase.Handle:=DBHAndle;
      self.ActualDate:=ActualDate;
      DateTimeToString(ActualDate_str,'dd.mm.yyyy',self.ActualDate);

                       begin
                             self.Caption:='Оберіть бюджет'; //'Бюджети, які функціонують на '+ActualDate_str;
                             SmetaDataSet.SQLs.SelectSQL.Text:= 'select * from Z_SIMPLEREESTR_FILTER('+
                             inttostr(id_vidopl_prop)+','+
                             inttostr(Kod_Setup)+','+
                             inttostr(id_session)+') order by KOD_SMETA descending';

                             SmetaDataSet.Open;
                             SmetaDataSet.FetchAll;
                             RxMemoryData1:=TRxMemoryData.Create(Application);
                             RxMemoryData1.Close;
                             RxMemoryData1.FieldDefs.Clear;
                             RxMemoryData1.FieldDefs.Add('SELCHECK',ftString,1,True);
                             RxMemoryData1.FieldDefs.Add('ID_SMETA',ftString,16,True);
                             RxMemoryData1.FieldDefs.Add('SMETA_TITLE',ftString,180,True);
                             RxMemoryData1.FieldDefs.Add('KOD_SMETA',ftString,10,True);
                             RxMemoryData1.Open;
                           //  RxMemoryData1.SortOnFields('SMETA_KOD',False,false);
                             RxMemoryData1.LoadFromDataSet(SmetaDataSet,0,lmAppend);
                             RxMemoryData1.first;
                             while (not RxMemoryData1.eof)  do
                             begin
                              RxMemoryData1.Edit;
                              RxMemoryData1.FieldByName('SELCHECK').Value:='T';
                              RxMemoryData1.post;
                              RxMemoryData1.Next;
                             end;
                             RxMemoryData1.Edit;
                             RxMemoryData1['SELCHECK']:='T';
                             RxMemoryData1.post;
                             RxMemoryData1.first;
                             DataSource1.DataSet:=RxMemoryData1;
                       end;

end;

procedure TFpub_spr_smet.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
      Action:=caFree;
end;

procedure TFpub_spr_smet.ToolButton3Click(Sender: TObject);
begin

                         SmetaDataSet.Close;
                         
                         SmetaDataSet.Open;
                         SmetaDataSet.FetchAll;

                         RxMemoryData1:=TRxMemoryData.Create(Application);
                         RxMemoryData1.Close;
                         RxMemoryData1.FieldDefs.Clear;
                         RxMemoryData1.FieldDefs.Add('SELCHECK',ftString,1,True);
                         RxMemoryData1.FieldDefs.Add('ID_SMETA',ftString,16,True);
                         RxMemoryData1.FieldDefs.Add('SMETA_TITLE',ftString,180,True);
                         RxMemoryData1.FieldDefs.Add('SMETA_KOD',ftString,10,True);
                         RxMemoryData1.Open;
                         RxMemoryData1.LoadFromDataSet(SmetaDataSet,0,lmAppend);
                         RxMemoryData1.first;
                         while (not RxMemoryData1.eof)  do
                         begin
                          RxMemoryData1.Edit;
                          RxMemoryData1.FieldByName('SELCHECK').Value:='T';
                          RxMemoryData1.post;
                          RxMemoryData1.Next;
                         end;
                         RxMemoryData1.Edit;
                         RxMemoryData1['SELCHECK']:='T';
                         RxMemoryData1.post;
                         RxMemoryData1.first;

                                            

end;

procedure TFpub_spr_smet.cxGrid3DBTableView1FocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
var id:int64;
begin

end;

procedure TFpub_spr_smet.ViewButtonClick(Sender: TObject);
var temp:Integer;
begin

                       //////
                         DataSource1.DataSet:=nil;
                         temp:=0;
                         RxMemoryData1.first;
                         while not RxMemoryData1.eof do
                         begin
                          if RxMemoryData1['SELCHECK']='T' then
                            begin
                             temp:=1;
                             break;
                            end;
                            RxMemoryData1.next;
                         end;

                         if temp=0 then
                            begin
                              ShowMessage('Не обрано бюджет');
                              Exit;
                            end;
                            
                         RxMemoryData1.first;
                         while not RxMemoryData1.eof do
                          if RxMemoryData1['SELCHECK']<>'T' then RxMemoryData1.delete
                          else RxMemoryData1.next;

                         if RxMemoryData1['SELCHECK']<>'T' then RxMemoryData1.delete;
                         
                         ResultDataSet:=RxMemoryData1;
                         DataSource1.DataSet:=RxMemoryData1;
                         ModalResult:=mrYes;



end;

function TFpub_spr_smet.CheckChValues: Boolean;

begin

end;



procedure TFpub_spr_smet.ToolButton4Click(Sender: TObject);
begin
  RxMemoryData1.Close;
  if ReadTransaction.Active then ReadTransaction.Commit;
  if WriteTransaction.Active then WriteTransaction.Rollback;
  close;
end;

procedure TFpub_spr_smet.SmViewKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key=VK_RETURN)
  THEN BEGIN
       ViewButton.OnClick(self);
  END
end;

procedure TFpub_spr_smet.cxGrid3DBTableView1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key=VK_RETURN)
  THEN BEGIN
       ViewButton.OnClick(self);
  END

end;

procedure TFpub_spr_smet.cxGrid4DBTableView1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key=VK_RETURN)
  THEN BEGIN
       ViewButton.OnClick(self);
  END

end;

procedure TFpub_spr_smet.cxGrid3DBTableView1DblClick(Sender: TObject);
begin
       ViewButton.OnClick(self);
end;

procedure TFpub_spr_smet.cxGrid4DBTableView1DblClick(Sender: TObject);
begin
       ViewButton.OnClick(self);
end;


procedure TFpub_spr_smet.ToolButton1Click(Sender: TObject);
var id_sm,MODE,SM_CODE,SM_TITLE:String;
begin
    if T=nil then T:=TfrmGetPosForm.Create(self);
    if T.ShowModal=mrYes
    then begin
               if SearchDataSet.Active then SearchDataSet.Close;

               if T.CheckCode.Checked
               then begin
                         MODE:='1';
                         SM_CODE:=T.EdCode.Text;
                         SM_TITLE:='';
               end
               else begin
                         MODE:='0';
                         SM_CODE:='0';
                         SM_TITLE:=T.EdTitle.Text;
               end;

               SearchDataSet.SelectSQL.Text:='SELECT * FROM BU_SEARCH('+SM_CODE+','+''''+SM_TITLE+''''+','+''''+datetostr(self.ActualDate)+''''+','+MODE+')'+' order by ID_SMETA asc';
               SearchDataSet.Open;
               SearchDataSet.FetchAll;
               SearchDataSet.First;
               //SmetaDataSet.Locate('ID_SMETA',SearchDataSet['ID_SMETA'],[]);
               ID_SM:=SearchDataSet.FieldByName('ID_SMETA').AsString;
               RxMemoryData1.Locate('ID_SMETA',ID_SM,[]);
               {SmView.BeginUpdate;
                      SmView.DataController.LocateByKey(ID_SM);
               SmView.EndUpdate;}

    end;
end;

procedure TFpub_spr_smet.Action3Execute(Sender: TObject);
var ID_SM:String;
begin
    smview.Controller.GoToNext(True);
end;



procedure TFpub_spr_smet.SmetaDataSetCalcFields(DataSet: TDataSet);
var Field: TStringField;
begin


end;

procedure TFpub_spr_smet.ToolButton6Click(Sender: TObject);
var id:Integer;
begin
 DataSource1.DataSet:=nil;
 id:=StrToInt(RxMemoryData1['ID_SMETA']);
 RxMemoryData1.First;
 while not RxMemoryData1.Eof do
 begin
 if RxMemoryData1['SELCHECK']='F' then
  begin
    RxMemoryData1.Edit;
    RxMemoryData1['SELCHECK']:='T';
    RxMemoryData1.Post;
  end
 else if RxMemoryData1['SELCHECK']='T' then
  begin
    RxMemoryData1.Edit;
    RxMemoryData1['SELCHECK']:='F';
    RxMemoryData1.Post;
  end;
  RxMemoryData1.Next;
 end;

 RxMemoryData1.Locate('ID_SMETA',id,[]);
 DataSource1.DataSet:=RxMemoryData1;
end;

procedure TFpub_spr_smet.ToolButton2Click(Sender: TObject);
var id:Integer;
begin
  DataSource1.DataSet:=nil;
  id:=StrToInt(RxMemoryData1['ID_SMETA']);
  RxMemoryData1.First;
  while not RxMemoryData1.Eof do
  begin
    RxMemoryData1.Edit;
    RxMemoryData1['SelCheck']:='T';
    RxMemoryData1.Post;
    RxMemoryData1.Next;
  end;
  RxMemoryData1.Edit;
  RxMemoryData1['SelCheck']:='T';
  RxMemoryData1.Post;
  RxMemoryData1.Locate('ID_SMETA',id,[]);
  DataSource1.DataSet:=RxMemoryData1;
end;

procedure TFpub_spr_smet.ToolButton5Click(Sender: TObject);
var id:Integer;
begin
  DataSource1.DataSet:=nil;
  id:=StrToInt(RxMemoryData1['ID_SMETA']);
  RxMemoryData1.First;
  while not RxMemoryData1.Eof do
  begin
    RxMemoryData1.Edit;
    RxMemoryData1['SelCheck']:='F';
    RxMemoryData1.Post;
    RxMemoryData1.Next;
  end;
  RxMemoryData1.Edit;
  RxMemoryData1['SelCheck']:='F';
  RxMemoryData1.Post;
  RxMemoryData1.Locate('ID_SMETA',id,[]);
  DataSource1.DataSet:=RxMemoryData1;
end;

procedure TFpub_spr_smet.smviewMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  RxMemoryData1.Edit;
  if   RxMemoryData1['SelCheck']='F' then RxMemoryData1['SelCheck']:='T'
  else if RxMemoryData1['SelCheck']='T' then RxMemoryData1['SelCheck']:='F';
  RxMemoryData1.Post;
end;

end.
