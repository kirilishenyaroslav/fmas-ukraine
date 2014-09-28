unit uReportFilterMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridTableView, ImgList, dxBar,
  dxBarExtItems, cxGridLevel, cxGridCustomTableView, cxGridDBTableView,
  cxClasses, cxControls, cxGridCustomView, cxGrid,ucs_Types,
  cxCheckBox, uDateFilter,uUnivSprav,RxMemDS, uperiodFilter;

type
  TfmFilterMain = class(TForm)
    Grid: TcxGrid;
    GridDBView: TcxGridDBTableView;
    GridDBViewDBColumn1: TcxGridDBColumn;
    GridDBViewDBColumn2: TcxGridDBColumn;
    GridLevel: TcxGridLevel;
    BarManager: TdxBarManager;
    AddButton: TdxBarLargeButton;
    EditButton: TdxBarLargeButton;
    DeleteButton: TdxBarLargeButton;
    RefreshButton: TdxBarLargeButton;
    ExitButton: TdxBarLargeButton;
    dxBarLargeButton1: TdxBarLargeButton;
    dxBarLargeButton2: TdxBarLargeButton;
    dxBarSubItem1: TdxBarSubItem;
    dxBarButton1: TdxBarButton;
    ClearFltBtn: TdxBarLargeButton;
    DisabledLargeImages: TImageList;
    PopupImageList: TImageList;
    LargeImages: TImageList;
    Styles: TcxStyleRepository;
    BackGround: TcxStyle;
    FocusedRecord: TcxStyle;
    Header: TcxStyle;
    DesabledRecord: TcxStyle;
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
    Default_StyleSheet: TcxGridTableViewStyleSheet;
    DevExpress_Style: TcxGridTableViewStyleSheet;
    OkBtn: TdxBarLargeButton;
    procedure ClearFltBtnClick(Sender: TObject);
    procedure OkBtnClick(Sender: TObject);
    procedure GridDBViewDblClick(Sender: TObject);
    procedure ExitButtonClick(Sender: TObject);
    procedure LoadMemory;
    procedure ClearTable;
  private
    id_session, id_sp_report : int64;
  public
   constructor  Create(AParameter:TcsParamPacks);
  end;

{var
  fmFilterMain: TfmFilterMain;  }

  function CreateSprav(AParameter:TcsParamPacks):Variant;stdcall;
exports  CreateSprav;

implementation

uses DM_ReportFilter;

{$R *.dfm}

function CreateSprav(AParameter:TcsParamPacks):Variant;stdcall;
var
  ViewForm:TfmFilterMain;
begin
 // if AParameter.Formstyle = fsMDIChild then
 // if IsMDIChildFormShow(TfmFilterMain) then exit;
  ViewForm := TfmFilterMain.Create(AParameter);
  ViewForm.FormStyle:= AParameter.Formstyle;
end;


constructor  TfmFilterMain.Create(AParameter:TcsParamPacks);
begin
  Screen.Cursor := crHourGlass;

  inherited Create(AParameter.Owner);

  DM := TDM.Create(Self);
  DM.DB.Handle:=AParameter.DB_Handle;
  DM.DB.Connected := True;

  id_session   := AParameter.ID_SESSION;
  id_sp_report := AParameter.ID_Locate;

  GridDBView.DataController.DataSource := Dm.DSFilter;
  LoadMemory;

  Screen.Cursor:=crDefault;
end;

procedure TfmFilterMain.LoadMemory;
begin
    DM.DataSetFilter.Close;
    DM.DataSetFilter.SQLs.SelectSQL.Text := 'select f.id_report_sp_filter, f.name_report_sp_filter, f.formcaption, f.tablename, f.fields, f.fieldsname,'+
                                            ' f.keyfield, f.returnfields, f.use_bpl, f.name_functions, f.multiply_select from cs_dt_report_sp_filter f, cs_dt_report_relations r '+
                                            ' where f.id_report_sp_filter = r.id_report_sp_filter and r.id_sp_report='+inttostr(id_sp_report);
    DM.DataSetFilter.Open;

    DM.DataSetFilter.fetchall;
    DM.DataSetFilter.First;
    DM.MemoryData.Open;
    DM.MemoryDataSp.Open;

    while not DM.DataSetFilter.Eof do
    begin
          DM.MemoryData.Insert;
          DM.MemoryData.FieldByName('DataCheck').AsVariant                := 0;
          DM.MemoryData.FieldByName('DataName').AsVariant                 := DM.DataSetFilter['name_report_sp_filter'];
          DM.MemoryData.FieldByName('Dataid_report_sp_filter').AsVariant  := DM.DataSetFilter['id_report_sp_filter'];
          DM.MemoryData.FieldByName('Dataformcaption').AsVariant          := DM.DataSetFilter['formcaption'];
          DM.MemoryData.FieldByName('Datatablename').AsVariant            := DM.DataSetFilter['tablename'];
          DM.MemoryData.FieldByName('Datafields').AsVariant               := DM.DataSetFilter['fields'];
          DM.MemoryData.FieldByName('Datafieldsname').AsVariant           := DM.DataSetFilter['fieldsname'];
          DM.MemoryData.FieldByName('Datakeyfield').AsVariant             := DM.DataSetFilter['keyfield'];
          DM.MemoryData.FieldByName('Datareturnfields').AsVariant         := DM.DataSetFilter['returnfields'];
          DM.MemoryData.FieldByName('DataUsebpl').AsVariant               := DM.DataSetFilter['use_bpl'];
          DM.MemoryData.FieldByName('Dataname_functions').AsVariant       := DM.DataSetFilter['name_functions'];
          DM.MemoryData.FieldByName('DataMult').AsVariant                 := DM.DataSetFilter['multiply_select'];
          DM.MemoryData.Post;

          DM.DataSetFilter.Next;
    end;

end;

procedure TfmFilterMain.ClearTable;
begin
    dm.WriteTransaction.StartTransaction;
    dm.StoredProc.StoredProcName:='CS_DT_REPORT_VAL_PARAM_DEL';
    dm.StoredProc.Prepare;
    dm.StoredProc.ParamByName('IN_ID_REPORT_SESSION').AsInt64:=id_session;
    try
      dm.StoredProc.ExecProc;
    except
      begin
        dm.WriteTransaction.Rollback;
        Exit;
      end;
     end;
    dm.WriteTransaction.Commit;
end;

procedure TfmFilterMain.ClearFltBtnClick(Sender: TObject);
begin
    ClearTable;

    DM.MemoryDataSp.Close;
    DM.MemoryDataSp.EmptyTable;

    DM.MemoryData.Close;
    DM.MemoryData.EmptyTable;

    LoadMemory;
end;

procedure TfmFilterMain.OkBtnClick(Sender: TObject);
begin

    ClearTable;
    Dm.MemoryDataSp.Open;
    Dm.MemoryDataSp.First;
    while not Dm.MemoryDataSp.Eof do
    begin
        dm.WriteTransaction.StartTransaction;
        dm.StoredProc.StoredProcName:='CS_DT_REPORT_VAL_PARAM_INIT';
        dm.StoredProc.Prepare;
        dm.StoredProc.ParamByName('IN_ID_REPORT_SESSION').AsInt64  :=id_session;
        dm.StoredProc.ParamByName('IN_ID_SP_FILTER').AsInt64       := DM.MemoryDataSp.FieldByName('Dataid_report_sp_filter').AsVariant;
        if ((Vartype(DM.MemoryDataSp.FieldByName('DataValueFilter').AsVariant)=VarString)
            and (not VarIsNull(DM.MemoryDataSp.FieldByName('DataValueFilter').AsVariant))) then
        begin
            dm.StoredProc.ParamByName('IN_VALUE_PARAM').AsVariant       := null;
            dm.StoredProc.ParamByName('IN_VALUE_PARAM_STR').AsVariant   := DM.MemoryDataSp.FieldByName('DataValueFilter').AsVariant;
        end else
        begin
            dm.StoredProc.ParamByName('IN_VALUE_PARAM').AsVariant       := DM.MemoryDataSp.FieldByName('DataValueFilter').AsVariant;
            dm.StoredProc.ParamByName('IN_VALUE_PARAM_STR').AsVariant   := null;
        end;
        dm.StoredProc.ParamByName('IN_DATE_BEG').AsVariant              :=DM.MemoryDataSp.FieldByName('DataDateBeg').AsVariant;
        dm.StoredProc.ParamByName('IN_DATE_END').AsVariant              :=DM.MemoryDataSp.FieldByName('DataDateEnd').AsVariant;
        try
         dm.StoredProc.ExecProc;
        except
          begin
            dm.WriteTransaction.Rollback;
            Exit;
          end;
         end;
        dm.WriteTransaction.Commit;
        Dm.MemoryDataSp.Next;
    end;
    close;
end;

procedure TfmFilterMain.GridDBViewDblClick(Sender: TObject);
var
    Params:TUnivParams;
    IdFilter:Variant;
    OutPut : TRxMemoryData;
    ViewForm      : TfmDateFilter;
    ViewFormPeriod : TfmPeriodFilter;
begin
      IdFilter  :=DM.MemoryData.FieldByName('Dataid_report_sp_filter').AsVariant;
      DM.MemoryData.Open;
      DM.MemoryData.Edit;
      if( DM.MemoryData.FieldByName('DataCheck').Value = 0) then
           DM.MemoryData.FieldByName('DataCheck').Value             := 1
      else
           DM.MemoryData.FieldByName('DataCheck').Value             := 0;
      DM.MemoryData.Post;
     if(DM.MemoryData.FieldByName('DataCheck').Value=1) then
     begin
         if DM.MemoryData.FieldByName('DataUsebpl').AsInteger =1 then
         begin
             if (DM.MemoryData['Dataid_report_sp_filter']<>2) then
             begin
                  Params.FormCaption  := DM.MemoryData.FieldByName('Dataformcaption').AsString;
                  Params.ShowMode     := fsmMSelect;
                  Params.ShowButtons  := [fbExit];
                  Params.TableName    := DM.MemoryData.FieldByName('Datatablename').AsString;
                  Params.Fields       := DM.MemoryData.FieldByName('Datafields').AsString;
                  Params.FieldsName   := DM.MemoryData.FieldByName('Datafieldsname').AsString;
                  Params.KeyField     := DM.MemoryData.FieldByName('Datakeyfield').AsString;
                  Params.ReturnFields := DM.MemoryData.FieldByName('Datareturnfields').AsString;
                  Params.DBHandle     := Integer(DM.DB.Handle);

                  OutPut:=TRxMemoryData.Create(self);

                  if GetUnivSprav(Params,OutPut)then
                  begin
                      Output.First;
                      DM.MemoryDataSp.Open;
                      {DM.MemoryDataSp.First;
                      while not DM.MemoryDataSp.Eof do
                      begin

                          if(DM.MemoryDataSp.FieldByName('Dataid_report_sp_filter').Value =idfilter) then
                             DM.MemoryDataSp.Delete;
                          DM.MemoryDataSp.Next;
                      end;}
                      while not Output.Eof do
                      begin
                          DM.MemoryDataSp.Insert;
                          DM.MemoryDataSp.FieldByName('DataCheck').AsVariant                := 1;
                          DM.MemoryDataSp.FieldByName('Dataid_report_sp_filter').AsVariant  := IdFilter;
                          DM.MemoryDataSp.FieldByName('DataValueFilter').Value              := Output[Params.ReturnFields];
                          DM.MemoryDataSp.Post;
                          Output.Next;
                      end
                  end;
              end
         end  else
         if (DM.MemoryData['Dataid_report_sp_filter']=1) then
         begin

                ViewForm                           := TfmDateFilter.Create(self);
                ViewForm.DB_handle                 := DM.DB.Handle;
                ViewForm.cxDateEditbegin.Date      := date;
                ViewForm.Caption                   := 'На дату';

                DM.MemoryDataSp.Locate('Dataid_report_sp_filter', IdFilter, []);

                ViewForm.ShowModal;


                if ViewForm.ModalResult = mrOk then
                begin
                      DM.MemoryDataSp.Open;

                      DM.MemoryDataSp.Insert;
                      DM.MemoryDataSp.FieldByName('DataCheck').AsVariant                := 1;
                      DM.MemoryDataSp.FieldByName('Dataid_report_sp_filter').AsVariant  := IdFilter;
                      DM.MemoryDataSp.FieldByName('DataDateBeg').Value                  := ViewForm.cxDateEditbegin.Date ;
                      DM.MemoryDataSp.Post;

                end;
         end else
         if (DM.MemoryData['Dataid_report_sp_filter']=5) then
             begin

                ViewFormPeriod                           := TfmPeriodFilter.Create(self);
                ViewFormPeriod.DB_handle                 := DM.DB.Handle;
                ViewFormPeriod.cxDateEditbegin.Date      := date;
                ViewFormPeriod.cxDateEditEnd.Date        := date;
                ViewFormPeriod.Caption                   := 'Період';
                
                DM.MemoryDataSp.Locate('Dataid_report_sp_filter', IdFilter, []);

                ViewFormPeriod.ShowModal;

                if ViewFormPeriod.ModalResult = mrOk then
                begin
                      DM.MemoryDataSp.Open;

                      DM.MemoryDataSp.Edit;
                      DM.MemoryDataSp.FieldByName('DataCheck').AsVariant                := 1;
                      DM.MemoryDataSp.FieldByName('Dataid_report_sp_filter').AsVariant  := IdFilter;
                      DM.MemoryDataSp.FieldByName('DataDateBeg').Value                  := ViewFormPeriod.cxDateEditbegin.Date;
                      DM.MemoryDataSp.FieldByName('DataDateEnd').Value                  := ViewFormPeriod.cxDateEditEnd.Date;
                      DM.MemoryDataSp.Post;

                end;
             end;
     end else
     begin
         DM.MemoryDataSp.Open;
         DM.MemoryDataSp.First;
         while not DM.MemoryDataSp.Eof do
         begin
         if(DM.MemoryDataSp.FieldByName('Dataid_report_sp_filter').Value =idfilter) then
              DM.MemoryDataSp.Delete;
              DM.MemoryDataSp.Next;
         end;
     end;

end;

procedure TfmFilterMain.ExitButtonClick(Sender: TObject);
begin
    close;
end;

end.
