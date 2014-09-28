unit uAdrMainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxBar, dxBarExtItems, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, cxGridTableView,
  cxGridLevel, cxClasses, cxControls, cxGridCustomView, RXMemDS,
  cxGridCustomTableView, cxGridDBTableView, cxGrid, ActnList, cxContainer,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, ExtCtrls, cxLabel,
  uAdr_DataModule, cxDBLabel, Buttons, uFormControl, ImgList;

type
  TAdrMainForm = class(TForm)
    dxBarManager1: TdxBarManager;
    dxBarDockControl1: TdxBarDockControl;
    dxBLB_Add: TdxBarLargeButton;
    dxBLB_Modif: TdxBarLargeButton;
    dxBLB_Del: TdxBarLargeButton;
    DataSource1: TDataSource;
    ActionList1: TActionList;
    cxStyleRepository1: TcxStyleRepository;
    GridTableViewStyleSheetUserFormat3: TcxGridTableViewStyleSheet;
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
    dxBLB_Select: TdxBarLargeButton;
    dxBLB_Cansel: TdxBarLargeButton;
    AddA: TAction;
    ModifA: TAction;
    DelA: TAction;
    OkA: TAction;
    CancelA: TAction;
    Panel1: TPanel;
    Panel2: TPanel;
    cxDBLZip: TcxDBLabel;
    cxDBLRegion: TcxDBLabel;
    cxDBLDistrict: TcxDBLabel;
    cxTE_Filter: TcxTextEdit;
    cxLabel2: TcxLabel;
    dxBarContainerItem1: TdxBarContainerItem;
    dxBarControlContainerItem1: TdxBarControlContainerItem;
    Panel3: TPanel;
    cxCB_field: TcxComboBox;
    SpeedButton1: TSpeedButton;
    FilterA: TAction;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    cxStyle12: TcxStyle;
    dxBLB_Refresh: TdxBarLargeButton;
    RefreshA: TAction;
    cxGrid_Adress: TcxGrid;
    cxGrid_AdressView: TcxGridDBTableView;
    cxGrid_AdressViewDBId: TcxGridDBColumn;
    cxGrid_AdressViewDBAdr_Name: TcxGridDBColumn;
    cxGrid_AdressViewDBCountry: TcxGridDBColumn;
    cxGrid_AdressViewDBRegion: TcxGridDBColumn;
    cxGrid_AdressViewDBCity: TcxGridDBColumn;
    cxGrid_AdressViewDBStreet: TcxGridDBColumn;
    cxGrid_AdressViewDBHouse: TcxGridDBColumn;
    cxGrid_AdressViewDBFlat: TcxGridDBColumn;
    cxGrid_AdressViewDBZip: TcxGridDBColumn;
    cxGrid_AdressViewDBDistrict: TcxGridDBColumn;
    cxGrid_AdressViewDBDBeg: TcxGridDBColumn;
    cxGrid_AdressViewDBDEnd: TcxGridDBColumn;
    cxGrid_AdressLevel1: TcxGridLevel;
    cxGrid_AdressViewDBCArea: TcxGridDBColumn;
    ImageList1: TImageList;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure AddAExecute(Sender: TObject);
    procedure ModifAExecute(Sender: TObject);
    procedure DelAExecute(Sender: TObject);
    procedure OkAExecute(Sender: TObject);
    procedure CancelAExecute(Sender: TObject);
    procedure FilterAExecute(Sender: TObject);
    procedure RefreshAExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cxGrid_AdressViewDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    Input, Output: TRxMemoryData;
    DMod : TAdrDM;
    constructor Create(AOwner: TComponent; DataModule: TAdrDM;
              Input: TRxMemoryData = nil; Output: TRxMemoryData = nil);reintroduce;

    { Public declarations }
  end;

implementation



{$R *.dfm}

constructor TAdrMainForm.Create(AOwner: TComponent; DataModule: TAdrDM; Input: TRxMemoryData = nil; Output: TRxMemoryData = nil);
begin
    inherited Create(AOwner);
    Self.DMod := DataModule;
    Self.Input := Input;
    Self.Output := Output;
    DataSource1.DataSet := DMod.pFIBDS_SelectAdr;
    DMod.pFIBDS_SelectAdr.ParamByName('id_adr_pk').AsVariant:=input['id_adress'];
    DMod.pFIBDS_SelectAdr.Open;

    AddA.Enabled:=input['id_adress']=null;
    if Input <> nil then
    begin

        OkA.Enabled := (Input['Select'] <> 0);
        if (Input['Select'] = 0) then
         dxBLB_Select.Visible := ivNever;

        cxGrid_AdressView.OptionsSelection.MultiSelect:=(Input['Select'] = 2);
    end;
end;


procedure TAdrMainForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if (FormStyle=fsMDIChild)
   then Action := caFree;
end;

procedure TAdrMainForm.AddAExecute(Sender: TObject);
{var AddForm: TAddModifAdrForm;
    clickOk: Boolean;   }
begin
{  AddForm:=TAddModifAdrForm.Create(Self,DMod,fmAdd,Null,Null);
  if (AddForm.ShowModal=mrOk) then
   begin
     DMod.pFIBDS_Id.ParamByName('id_adress').AsInteger:=AddForm.qFFC_Adress.LastId;
     DMod.pFIBDS_Id.Open;
     clickOk:=input['id_adress']=null;
     input.Append;
     input['id_adress']:=DMod.pFIBDS_Id['id_adr_pk'];
     input.Post;
     DMod.pFIBDS_Id.Close;
     RefreshAExecute(Sender);
     DMod.pFIBDS_SelectAdr.Locate('id_adress',AddForm.qFFC_Adress.LastId,[]);
     AddForm.Free;
//     if clickOk
//      then OkA.Execute;
   end
   else AddForm.Free;  }
end;

procedure TAdrMainForm.ModifAExecute(Sender: TObject);
{var AddForm: TAddModifAdrForm;}
begin
{  AddForm:=TAddModifAdrForm.Create(Self,DMod,fmModify,DMod.pFIBDS_SelectAdr['id_adress'],DMod.pFIBDS_SelectAdr['id_adr_PK']);
  if (AddForm.ShowModal=mrOk) then
   begin
     RefreshAExecute(Sender);
     DMod.pFIBDS_SelectAdr.Locate('id_adress',AddForm.qFFC_Adress.LastId,[]);
   end;
  AddForm.Free;  }
end;

procedure TAdrMainForm.DelAExecute(Sender: TObject);
begin
  try


    with DMod do
    begin
      pFIBT_WriteAdr.StartTransaction;
      pFIBQ_Delete.SQL.Clear;
      pFIBQ_Delete.SQL.Add(A_Del_SQL);
      pFIBQ_Delete.ParamByName('where').AsInteger:=pFIBDS_SelectAdr['id_adress'];
      pFIBQ_Delete.ExecProc;
      pFIBT_WriteAdr.Commit;
    end;
  except
      DMod.pFIBT_WriteAdr.Rollback;

  end;
  RefreshAExecute(Self);
end;

procedure TAdrMainForm.OkAExecute(Sender: TObject);
var i, count:integer;
begin
  if (DMod.pFIBDS_SelectAdr.IsEmpty) then
   begin
     ModalResult:=0;
     Exit;
   end;
  Output.Open;
  if (cxGrid_AdressView.OptionsSelection.MultiSelect) then
   begin
     count:=cxGrid_AdressView.Controller.SelectedRowCount;
     for i:=0 to count-1 do
     begin
       Output.Append;
       Output['Id_Adress'] := StrToInt(cxGrid_AdressView.Controller.SelectedRecords[i].Values[0]);
       Output['Name_Adr'] := cxGrid_AdressView.Controller.SelectedRecords[i].Values[1];
       Output.Post;
     end;
   end
  else
   begin
     Output.Append;
     Output['Id_Adress'] := StrToInt(cxGrid_AdressView.Controller.SelectedRecords[0].Values[0]);
     Output['Name_Adr'] := cxGrid_AdressView.Controller.SelectedRecords[0].Values[1];
     Output.Post;
   end;
  ModalResult:=mrOk;
end;

procedure TAdrMainForm.CancelAExecute(Sender: TObject);
begin
  Close;
end;

procedure TAdrMainForm.FilterAExecute(Sender: TObject);
begin
  if  (cxTE_Filter.Text = '')or(cxCB_field.ItemIndex=-1) then
   cxGrid_AdressView.DataController.Filter.Active := False
  else
  begin
    cxGrid_AdressView.DataController.Filter.Clear;
    cxGrid_AdressView.DataController.Filter.AddItem(Nil, cxGrid_AdressView.Columns[cxCB_field.ItemIndex+2],
                                              foLike, '%' + cxTE_Filter.Text + '%',
                                              '%' + cxTE_Filter.Text + '%');
    cxGrid_AdressView.DataController.Filter.Active := True;
  end;
end;

procedure TAdrMainForm.RefreshAExecute(Sender: TObject);
begin
  DMod.pFIBDS_SelectAdr.Close;
  DMod.pFIBDS_SelectAdr.ParamByName('id_adr_pk').AsVariant:=input['id_adress'];
//    DMod.pFIBDS_SelectAdr.ParamByName('ActDate').AsDate:=AddForm.qFDC_DateBeg.Value;
  DMod.pFIBDS_SelectAdr.Open;
  AddA.Enabled:=input['id_adress']=null;
//  ShowMessage(VarToStr(input['id_adress']));
//  cxGrid_AdressView.
end;

procedure TAdrMainForm.FormShow(Sender: TObject);
begin
    if input['id_adress']=null
     then AddA.Execute;
end;

procedure TAdrMainForm.cxGrid_AdressViewDblClick(Sender: TObject);
begin
  if (OkA.Enabled) then OkA.Execute;
end;

end.
