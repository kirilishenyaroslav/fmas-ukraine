unit uRep_Spr_list;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, ImgList, cxTL, Placemnt, cxGridLevel,
  cxClasses, cxControls, cxGridCustomView, cxGrid, iBase, uMain_DM,
  uCommon_Types, uCommon_Loader, uCommon_Funcs, uConsts, uCommonSp,
  AllPeopleUnit, DogLoaderUnit, ActnList;

type
  TfrmRep_Spr_list = class(TForm)
    Grid_Report_spr: TcxGrid;
    Grid_Report_sprDBTableView1: TcxGridDBTableView;
    Grid_Report_sprLevel1: TcxGridLevel;
    FormStorage: TFormStorage;
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
    cxStyle32: TcxStyle;
    cxStyle33: TcxStyle;
    cxStyle34: TcxStyle;
    cxStyle35: TcxStyle;
    cxStyle36: TcxStyle;
    cxStyle37: TcxStyle;
    cxStyle38: TcxStyle;
    cxStyle39: TcxStyle;
    cxStyle40: TcxStyle;
    cxStyle41: TcxStyle;
    cxStyle42: TcxStyle;
    cxStyle43: TcxStyle;
    cxStyle44: TcxStyle;
    cxStyle45: TcxStyle;
    cxStyle46: TcxStyle;
    cxStyle47: TcxStyle;
    cxStyle48: TcxStyle;
    cxStyle49: TcxStyle;
    cxStyle50: TcxStyle;
    cxStyle51: TcxStyle;
    cxStyle52: TcxStyle;
    cxStyle53: TcxStyle;
    cxStyle54: TcxStyle;
    cxStyle55: TcxStyle;
    cxStyle56: TcxStyle;
    cxStyle57: TcxStyle;
    testColorStyle: TcxStyle;
    TreeListStyleSheetDevExpress: TcxTreeListStyleSheet;
    PopupImageList: TImageList;
    LargeImages: TImageList;
    DisabledLargeImages: TImageList;
    Name: TcxGridDBColumn;
    Name_group: TcxGridDBColumn;
    ActionList1: TActionList;
    Action_exit: TAction;
    procedure Grid_Report_sprDBTableView1DblClick(Sender: TObject);
    procedure Action_exitExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    PLanguageIndex : Integer;
    aOwner : TComponent;
  public
    ID_USER   : int64;
    is_Admin  : boolean;
    Name_user : string;
    constructor Create(aOwner : TComponent; Name_table : string; ID_USER : int64; is_Admin : boolean; Name_user : string); reintroduce;
  end;

var
  frmRep_Spr_list: TfrmRep_Spr_list;

implementation

uses uMain_Form;

{$R *.dfm}

constructor TfrmRep_Spr_list.Create(aOwner : TComponent; Name_table : string; ID_USER : int64; is_Admin : boolean; Name_user : string);
begin
  inherited Create(aOwner);

  self.ID_USER   := id_user;
  Self.is_Admin  := is_Admin;
  Self.Name_user := Name_user;
  Self.aOwner    := aOwner;

  PLanguageIndex := uCommon_Funcs.bsLanguageIndex;

  Name.Caption := bs_Name_Column[PLanguageIndex];

  Grid_Report_sprDBTableView1.DataController.DataSource := frmMainDM.ReadDataSource;

  frmMainDM.ReadDataSet.close;
  frmMainDM.ReadDataSet.SQLs.SelectSQL.Text := 'Select * From '+ Name_table + ' Order by Name_group, Name';
  frmMainDM.ReadDataSet.open;

  //проверка на возможность входа

  Grid_Report_sprDBTableView1.ViewData.Expand(True);
end;

procedure TfrmRep_Spr_list.Grid_Report_sprDBTableView1DblClick(
  Sender: TObject);
var
  AParameter : TbsSimpleParams;
  Name_BPL, Name_Procedure : String;
  SP : TSprav;
  i, o : TSpravParams;
begin
  if frmMainDM.ReadDataSet['Name_bpl'] <> null
   then Name_Bpl       := frmMainDM.ReadDataSet['Name_bpl']
   else Name_Bpl       := '0';

  if frmMainDM.ReadDataSet['Name_procedure'] <> null
   then Name_Procedure := frmMainDM.ReadDataSet['Name_procedure']
   else Name_Procedure := '0';

  case Name_Bpl[1] of
   '1':Begin
        // создать справочник
        sp :=  GetSprav('SpDepartment');
        if sp <> nil then
         begin
          // заполнить входные параметры
          with sp.Input do
           begin
            Append;
            FieldValues['DBHandle'] := Integer(uMain_DM.frmMainDM.Main_DB.Handle);
            // модальный показ
            FieldValues['ShowStyle'] := 1;
            // единичная выборка
            FieldValues['Select'] := 1;
            FieldValues['AllowEdit'] := true;
            Post;
           end;
         end;
        // показать справочник и проанализировать результат (выбор одного подр.)
        sp.Show;
        sp.Free;
       end;
   '2':AllPeopleUnit.GetManForASUP(Self, uMain_DM.frmMainDM.Main_DB.Handle ,False,True, -1);
   '3':begin
        LoadSysData(frmMainDM.ReadTransaction);
        i := TSpravParams.Create;
        o := TSpravParams.Create;
        i['DataBase']     := Integer(uMain_DM.frmMainDM.Main_DB.Handle);
        i['FormStyle']    := fsNormal;
        i['bMultiSelect'] := false;
        i['id_session']   := -1;
        i['SelectMode']   := SelCustomer;
        LoadSprav('Customer\CustPackage.bpl', Self, i, o);
       end;
  else
   Begin
    AParameter                 := TbsSimpleParams.Create;
    AParameter.Owner           := aOwner;
    AParameter.Db_Handle       := uMain_DM.frmMainDM.Main_DB.Handle;
    AParameter.ID_User         := id_user;
    AParameter.User_Name       := Name_user;
    AParameter.Formstyle       := fsMDIChild;
    AParameter.WaitPakageOwner := self;
    AParameter.is_admin        := is_admin;

    RunFunctionFromPackage(AParameter, 'BillingSystem\' + Name_BPL, Name_Procedure);
    AParameter.Free;
   End;
  end;
end;

procedure TfrmRep_Spr_list.Action_exitExecute(Sender: TObject);
begin
  close;
end;

procedure TfrmRep_Spr_list.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if FormStyle = fsMDIChild then action := caFree;
end;

end.
