unit EditList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,StudcityConst, ComCtrls, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, cxTextEdit,
  cxCheckBox, cxGridTableView, cxGridLevel, cxGridCustomTableView,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGrid,
  ExtCtrls, StdCtrls, FIBDataSet, pFIBDataSet, cxContainer, cxMaskEdit,
  cxButtonEdit, cxLabel, RxMemDS,St_Loader_Unit, cxLookAndFeelPainters,
  cxButtons, FIBQuery, pFIBQuery, pFIBStoredProc, cxDropDownEdit,
  cxCalendar;

type
  TfrmEditList = class(TForm)
    StatusBar1: TStatusBar;
    cxGridListSubs: TcxGrid;
    cxGridListSubsDBTableView1: TcxGridDBTableView;
    cxGridListSubsLevel1: TcxGridLevel;
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
    cxStyleSilver: TcxStyle;
    GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet;
    cxGrid1: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    GroupBox1: TGroupBox;
    pFIBDataSetPR: TpFIBDataSet;
    DataSourcePR: TDataSource;
    pFIBDataSetPeople: TpFIBDataSet;
    DataSourcePeople: TDataSource;
    cxGridListSubsDBTableView1DBColumn1: TcxGridDBColumn;
    cxGridDBTableView1DBColumn1: TcxGridDBColumn;
    cxButtonEditBuilds: TcxButtonEdit;
    cxLabelBuilds: TcxLabel;
    RxMemoryDataPeople: TRxMemoryData;
    RxMemoryDataPR: TRxMemoryData;
    pFIBDataSetBuilds: TpFIBDataSet;
    Panel1: TPanel;
    Animate1: TAnimate;
    cxLabel1: TcxLabel;
    Timer1: TTimer;
    pFIBStoredProc: TpFIBStoredProc;
    cxButtonClose: TcxButton;
    cxButtonSave: TcxButton;
    cxButtonAllInList: TcxButton;
    cxButtonOneInList: TcxButton;
    cxButtonAllToList: TcxButton;
    cxButtonOneToList: TcxButton;
    procedure cxButtonEditBuildsPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButtonCloseClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure cxButtonOneToListClick(Sender: TObject);
    procedure cxButtonAllToListClick(Sender: TObject);
    procedure cxButtonOneInListClick(Sender: TObject);
    procedure cxButtonAllInListClick(Sender: TObject);
    procedure cxButtonSaveClick(Sender: TObject);
  private
    { Private declarations }
  public
    constructor Create (Aowner:TComponent;id_list:Variant);overload;
    { Public declarations }
  end;

var
  frmEditList: TfrmEditList;
  id_list_ed:int64;
  type_run:Integer;
  id_builds:Int64;
implementation
uses
  MainLiStROVD;
{$R *.dfm}
constructor TfrmEditList.Create (Aowner:TComponent;id_list:Variant);
var
  i:Integer;
begin
  inherited Create (Aowner);
  id_list_ed:=id_list;
  
  cxLabelBuilds.Caption:=StudcityConst.st_listROVD_BUILDS;
  if id_list=0 then
    begin
      Caption:=StudcityConst.st_listROVD_NEW;
      type_run:=0;
    end
    else
    begin
      Caption:=StudcityConst.st_listROVD_EDIT;

      type_run:=1;

      Timer1.Enabled:=true;
    end;
   
end;


procedure TfrmEditList.cxButtonEditBuildsPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  ResOpl:Variant;
  BuildInfo: TBuildsInfo;
  i:Integer;
begin
if type_run=1 then
  begin
    exit;
  end;
  BuildInfo.id_build:=-1;
  BuildInfo.N_Room:='';
  ResOpl:=St_Loader_Unit.Load_st_Builds(self,TfrmMAinListROVD(self.owner).Database.Handle,true,false,BuildInfo);
 if VarArrayDimCount(ResOpl)>0 then
   begin
     pFIBDataSetBuilds.Active:=false;
     pFIBDataSetBuilds.Database:=TfrmMAinListROVD(self.owner).Database;
     pFIBDataSetBuilds.Transaction:=TfrmMAinListROVD(self.owner).ReadTransaction;
     pFIBDataSetBuilds.ParamByName('param_id_builds').AsInt64:=ResOpl[0];
     pFIBDataSetBuilds.Active:=true;
     cxButtonEditBuilds.Text:=pFIBDataSetBuilds.fieldbyname('builds').AsString;

     id_builds:=ResOpl[0];

     Panel1.Visible:=true;
     Animate1.CommonAVI := aviFindFolder;
     Animate1.Active    := true;
     refresh;


     pFIBDataSetPr.Database:=TfrmMAinListROVD(self.owner).Database;
     pFIBDataSetPr.Transaction:=TfrmMAinListROVD(self.owner).ReadTransaction;
     pFIBDataSetPr.Active:=false;
     pFIBDataSetPr.ParamByName('ID_BUILDS').AsInt64:=ResOpl[0];
     pFIBDataSetPr.Active:=true;
     cxGridListSubsDBTableView1.BeginUpdate;

      pFIBDataSetPR.FetchAll;
      RxMemoryDataPR.EmptyTable;
      for i:=0 to pFIBDataSetPR.RecordCount-1 do
        begin
          RxMemoryDataPR.Open;
          RxMemoryDataPR.Insert;
          RxMemoryDataPR.FieldByName('RxFIO').AsString:='';
          RxMemoryDataPR.FieldByName('RxID_PEOPLE').AsVariant:=0;
          RxMemoryDataPR.Post;
          pFIBDataSetPR.Next;
        end;
      RxMemoryDataPR.First;
      pFIBDataSetPR.First;
      for i:=0 to pFIBDataSetPR.RecordCount-1 do
        begin
          RxMemoryDataPR.Open;
          RxMemoryDataPR.Edit;
          RxMemoryDataPR.FieldByName('RxFIO').AsString:=pFIBDataSetPR.FieldByName('FIO').AsString;
          RxMemoryDataPR.FieldByName('RxID_PEOPLE').AsVariant:=pFIBDataSetPR.FieldByName('ID_PEOPLE').AsVariant;
          RxMemoryDataPR.Post;
          pFIBDataSetPR.Next;
          RxMemoryDataPR.Next;
        end;

     cxGridListSubsDBTableView1.EndUpdate;
     RxMemoryDataPR.First;

     Panel1.Visible:=false;
     Animate1.CommonAVI := aviFindFile;
     Animate1.Active    := false;

   end;
end;

procedure TfrmEditList.cxButtonCloseClick(Sender: TObject);
begin
if MessageBox(Handle,PChar('Вы уверены, что хотите закрыть форму?'),'Подтверждение',MB_YESNO or MB_ICONQUESTION)= mrYes then
  begin
    close;
  end;
end;

procedure TfrmEditList.Timer1Timer(Sender: TObject);
var
  i:Integer;
begin
      Timer1.Enabled:=false;

      Panel1.Visible:=true;
      Animate1.CommonAVI := aviFindFolder;
      Animate1.Active    := true;
      refresh;
      cxGridDBTableView1.BeginUpdate;

      pFIBDataSetPeople.Database:=TfrmMAinListROVD(self.owner).Database;
      pFIBDataSetPeople.Transaction:=TfrmMAinListROVD(self.owner).ReadTransaction;
      pFIBDataSetPeople.Active:=false;
      pFIBDataSetPeople.ParamByName('param_list').AsInt64:=id_list_ed;
      pFIBDataSetPeople.Active:=true;
      pFIBDataSetPeople.FetchAll;
      pFIBDataSetPeople.First;

      RxMemoryDataPeople.EmptyTable;
      for i:=0 to pFIBDataSetPeople.RecordCount-1 do
        begin
          RxMemoryDataPeople.Open;
          RxMemoryDataPeople.Insert;
          RxMemoryDataPeople.FieldByName('RxFIO').AsString:='';
          RxMemoryDataPeople.FieldByName('RxID_PEOPLE').AsVariant:=0;
          RxMemoryDataPeople.FieldByName('RxFlagNew').AsVariant:=0;
          RxMemoryDataPeople.Post;
          pFIBDataSetPeople.Next;
        end;
      RxMemoryDataPeople.First;
      pFIBDataSetPeople.First;
      for i:=0 to pFIBDataSetPeople.RecordCount-1 do
        begin
          RxMemoryDataPeople.Open;
          RxMemoryDataPeople.Edit;
          RxMemoryDataPeople.FieldByName('RxFIO').AsString:=pFIBDataSetPeople.FieldByName('FIO').AsString;
          RxMemoryDataPeople.FieldByName('RxID_PEOPLE').AsVariant:=pFIBDataSetPeople.FieldByName('ID_PEOPLE').AsVariant;
          RxMemoryDataPeople.FieldByName('RxFlagNew').AsVariant:=0;
          RxMemoryDataPeople.Post;
          pFIBDataSetPeople.Next;
          RxMemoryDataPeople.Next;
        end;



      pFIBDataSetBuilds.Active:=false;
      pFIBDataSetBuilds.Database:=TfrmMAinListROVD(self.owner).Database;
      pFIBDataSetBuilds.Transaction:=TfrmMAinListROVD(self.owner).ReadTransaction;
      pFIBDataSetBuilds.ParamByName('param_id_builds').AsInt64:=pFIBDataSetPeople.FieldByName('ID_BUILDS').AsInteger;
      pFIBDataSetBuilds.Active:=true;
      cxButtonEditBuilds.Text:=pFIBDataSetBuilds.fieldbyname('builds').AsString;


      pFIBDataSetPr.Database:=TfrmMAinListROVD(self.owner).Database;
      pFIBDataSetPr.Transaction:=TfrmMAinListROVD(self.owner).ReadTransaction;
      pFIBDataSetPr.Active:=false;
      pFIBDataSetPr.ParamByName('ID_BUILDS').AsVariant:=pFIBDataSetPeople.FieldByName('ID_BUILDS').AsVariant;
      pFIBDataSetPr.Active:=true;

      pFIBDataSetPR.FetchAll;
      RxMemoryDataPR.EmptyTable;
      for i:=0 to pFIBDataSetPR.RecordCount-1 do
        begin
          RxMemoryDataPR.Open;
          RxMemoryDataPR.Insert;
          RxMemoryDataPR.FieldByName('RxFIO').AsString:='';
          RxMemoryDataPR.FieldByName('RxID_PEOPLE').AsVariant:=0;
          RxMemoryDataPR.Post;
          pFIBDataSetPR.Next;
        end;
      RxMemoryDataPR.First;
      pFIBDataSetPR.First;
      for i:=0 to pFIBDataSetPR.RecordCount-1 do
        begin
          RxMemoryDataPR.Open;
          RxMemoryDataPR.Edit;
          RxMemoryDataPR.FieldByName('RxFIO').AsString:=pFIBDataSetPR.FieldByName('FIO').AsString;
          RxMemoryDataPR.FieldByName('RxID_PEOPLE').AsVariant:=pFIBDataSetPR.FieldByName('ID_PEOPLE').AsVariant;
          RxMemoryDataPR.Post;
          pFIBDataSetPR.Next;
          RxMemoryDataPR.Next;
        end;
      

      cxGridDBTableView1.EndUpdate;
      RxMemoryDataPeople.First;

      Panel1.Visible:=false;
      Animate1.CommonAVI := aviFindFile;
      Animate1.Active    := false;

end;

procedure TfrmEditList.cxButtonOneToListClick(Sender: TObject);
begin
  if RxMemoryDataPR.RecordCount>0 then
    begin
      RxMemoryDataPeople.Open;
      RxMemoryDataPeople.Insert;
      RxMemoryDataPeople.FieldByName('RxFIO').AsString:=RxMemoryDataPR.FieldByName('RxFIO').AsString;
      RxMemoryDataPeople.FieldByName('RxID_PEOPLE').AsVariant:=RxMemoryDataPR.FieldByName('RxID_PEOPLE').AsVariant;
      RxMemoryDataPeople.FieldByName('RxFlagNew').AsVariant:=1;
      RxMemoryDataPeople.Post;

      RxMemoryDataPR.Delete;
    end;
end;

procedure TfrmEditList.cxButtonAllToListClick(Sender: TObject);
var
  i:Integer;
begin
  Panel1.Visible:=true;
  Animate1.CommonAVI := aviFindFolder;
  Animate1.Active    := true;
  refresh;
  cxGridDBTableView1.BeginUpdate;
  cxGridListSubsDBTableView1.BeginUpdate;

  RxMemoryDataPR.First;

  for i:=0 to RxMemoryDataPR.RecordCount-1 do
    begin
      cxButtonOneToListClick(self);
      RxMemoryDataPR.Next;
    end;

  cxGridDBTableView1.EndUpdate;
  cxGridListSubsDBTableView1.EndUpdate;
  Panel1.Visible:=false;
  Animate1.CommonAVI := aviFindFile;
  Animate1.Active    := false;
end;

procedure TfrmEditList.cxButtonOneInListClick(Sender: TObject);
begin
  if RxMemoryDataPeople.RecordCount>0 then
    begin
      RxMemoryDataPR.Open;
      RxMemoryDataPr.Insert;
      RxMemoryDataPr.FieldByName('RxFIO').AsString:=RxMemoryDataPeople.FieldByName('RxFIO').AsString;
      RxMemoryDataPr.FieldByName('RxID_PEOPLE').AsVariant:=RxMemoryDataPeople.FieldByName('RxID_PEOPLE').AsVariant;
      RxMemoryDataPr.Post;

      RxMemoryDataPeople.Delete;
    end;

end;

procedure TfrmEditList.cxButtonAllInListClick(Sender: TObject);
var
  i:Integer;
begin
  Panel1.Visible:=true;
  Animate1.CommonAVI := aviFindFolder;
  Animate1.Active    := true;
  refresh;
  cxGridDBTableView1.BeginUpdate;
  cxGridListSubsDBTableView1.BeginUpdate;

  RxMemoryDataPeople.First;

  for i:=0 to RxMemoryDataPeople.RecordCount-1 do
    begin
      cxButtonOneInListClick(self);
      RxMemoryDataPeople.Next;
    end;

  cxGridDBTableView1.EndUpdate;
  cxGridListSubsDBTableView1.EndUpdate;
  Panel1.Visible:=false;
  Animate1.CommonAVI := aviFindFile;
  Animate1.Active    := false;
end;

procedure TfrmEditList.cxButtonSaveClick(Sender: TObject);
var
  i:Integer;
  id_list_save:Int64;
  id_people:Int64;
begin
if cxButtonEditBuilds.Text='' then
  begin
    Exit;
  end;

  if id_list_ed=0 then
    begin

      Panel1.Visible:=true;
      Animate1.CommonAVI := aviFindFolder;
      Animate1.Active    := true;
      refresh;
      cxGridDBTableView1.BeginUpdate;
      cxGridListSubsDBTableView1.BeginUpdate;

      pFIBStoredProc.Database:=TfrmMAinListROVD(self.owner).Database;
      pFIBStoredProc.Transaction:=TfrmMAinListROVD(self.owner).WriteTransaction;
      TfrmMAinListROVD(self.owner).WriteTransaction.StartTransaction;
      pFIBStoredProc.StoredProcName:='ST_DT_LIST_ROVD_NEW_LIST';
      pFIBStoredProc.Prepare;
      pFIBStoredProc.ParamByName('ID_BUILDS').AsInt64:=id_builds;
      try
        pFIBStoredProc.ExecProc;
        except
          begin
            TfrmMAinListROVD(self.owner).WriteTransaction.Rollback;
            Exit;
          end;
       end;
       TfrmMAinListROVD(self.owner).WriteTransaction.Commit;
       id_list_save:=pFIBStoredProc.FieldByName('ID_LIST').AsInt64;

       RxMemoryDataPeople.First;
       for i:=0 to  RxMemoryDataPeople.RecordCount-1 do
         begin
            id_people:=RxMemoryDataPeople.FieldByName('RXid_people').ASVariant;
            pFIBStoredProc.Database:=TfrmMAinListROVD(self.owner).Database;
            pFIBStoredProc.Transaction:=TfrmMAinListROVD(self.owner).WriteTransaction;
            TfrmMAinListROVD(self.owner).WriteTransaction.StartTransaction;
            pFIBStoredProc.StoredProcName:='ST_DT_LIST_ROVD_SAVE_CHANGE';
            pFIBStoredProc.Prepare;
            pFIBStoredProc.ParamByName('ID_LIST').AsInt64:=id_list_save;
            pFIBStoredProc.ParamByName('ID_PEOPLE').AsInt64:=id_people;
            pFIBStoredProc.ParamByName('TYPE_CHANGE').AsInteger:=1;

            try
              pFIBStoredProc.ExecProc;
              except
                begin
                  TfrmMAinListROVD(self.owner).WriteTransaction.Rollback;
                  ShowMessage('Ошибка при сохранении данных');
                  Exit;
                end;
             end;
             TfrmMAinListROVD(self.owner).WriteTransaction.Commit;

           RxMemoryDataPeople.Next;
         end;

         cxGridDBTableView1.EndUpdate;
         cxGridListSubsDBTableView1.EndUpdate;
         Panel1.Visible:=false;
         Animate1.CommonAVI := aviFindFile;
         Animate1.Active    := false;

         Close;
    end
    else
    begin
      Panel1.Visible:=true;
      Animate1.CommonAVI := aviFindFolder;
      Animate1.Active    := true;
      refresh;
      cxGridDBTableView1.BeginUpdate;
      cxGridListSubsDBTableView1.BeginUpdate;

      //удаление из списка
      RxMemoryDataPR.First;
       for i:=0 to  RxMemoryDataPR.RecordCount-1 do
         begin
            id_people:=RxMemoryDataPR.FieldByName('RXid_people').ASVariant;
            pFIBStoredProc.Database:=TfrmMAinListROVD(self.owner).Database;
            pFIBStoredProc.Transaction:=TfrmMAinListROVD(self.owner).WriteTransaction;
            TfrmMAinListROVD(self.owner).WriteTransaction.StartTransaction;
            pFIBStoredProc.StoredProcName:='ST_DT_LIST_ROVD_SAVE_CHANGE';
            pFIBStoredProc.Prepare;
            pFIBStoredProc.ParamByName('ID_LIST').AsInt64:=id_list_ed;
            pFIBStoredProc.ParamByName('ID_PEOPLE').AsInt64:=id_people;
            pFIBStoredProc.ParamByName('TYPE_CHANGE').AsInteger:=-1;
            try
              pFIBStoredProc.ExecProc;
              except
                begin
                  TfrmMAinListROVD(self.owner).WriteTransaction.Rollback;
                   ShowMessage('Ошибка при сохранении данных');
                  Exit;
                end;
             end;
             TfrmMAinListROVD(self.owner).WriteTransaction.Commit;

           RxMemoryDataPR.Next;
         end;



      //сохранение списка
       RxMemoryDataPeople.First;
       for i:=0 to  RxMemoryDataPeople.RecordCount-1 do
         begin
            id_people:=RxMemoryDataPeople.FieldByName('RXid_people').ASVariant;
            pFIBStoredProc.Database:=TfrmMAinListROVD(self.owner).Database;
            pFIBStoredProc.Transaction:=TfrmMAinListROVD(self.owner).WriteTransaction;
            TfrmMAinListROVD(self.owner).WriteTransaction.StartTransaction;
            pFIBStoredProc.StoredProcName:='ST_DT_LIST_ROVD_SAVE_CHANGE';
            pFIBStoredProc.Prepare;
            pFIBStoredProc.ParamByName('ID_LIST').AsInt64:=id_list_ed;
            pFIBStoredProc.ParamByName('ID_PEOPLE').AsInt64:=id_people;
            pFIBStoredProc.ParamByName('TYPE_CHANGE').AsInteger:=1;

            try
              pFIBStoredProc.ExecProc;
              except
                begin
                  TfrmMAinListROVD(self.owner).WriteTransaction.Rollback;
                  ShowMessage('Ошибка при сохранении данных');
                  Exit;
                end;
             end;
             TfrmMAinListROVD(self.owner).WriteTransaction.Commit;

           RxMemoryDataPeople.Next;
         end;


      cxGridDBTableView1.EndUpdate;
      cxGridListSubsDBTableView1.EndUpdate;
      Panel1.Visible:=false;
      Animate1.CommonAVI := aviFindFile;
      Animate1.Active    := false;

      Close;

    end;
end;

end.

