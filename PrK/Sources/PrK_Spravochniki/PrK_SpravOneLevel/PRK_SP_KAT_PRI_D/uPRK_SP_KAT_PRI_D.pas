unit uPRK_SP_KAT_PRI_D;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPrK_SpravOneLevel, cxGraphics, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, dxBar,
  dxBarExtItems, FIBQuery, pFIBQuery, pFIBStoredProc, FIBDatabase,
  pFIBDatabase, FIBDataSet, pFIBDataSet, ImgList, ActnList, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxControls, cxGridCustomView, cxGrid, dxStatusBar;

type
  TFormPRK_SP_KAT_PRI_D = class(TFormPrK_SpravOneLevel)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormPRK_SP_KAT_PRI_D: TFormPRK_SP_KAT_PRI_D;

implementation
uses
   uPrK_Resources,uConstants;
{$R *.dfm}

procedure TFormPRK_SP_KAT_PRI_D.FormCreate(Sender: TObject);
begin
  inherited;
{ID_NAME должен стоять первым так как в SelectSQLText может делаться CloseOpen}
  ID_NAME              :='ID_SP_KAT_PRI_D';
  SelectSQLText        :='Select * from PRK_SP_KAT_PRI_D_SELECT';
  ShowNpp              := false;
  StoredProcAddName    :='PRK_SP_KAT_PRI_D_ADD';
  StoredProcChangeName :='PRK_SP_KAT_PRI_D_CHANGE';
  StoredProcDelName    :='PRK_SP_KAT_PRI_D_DEL';
  NamePrKSpravEdit     := PrKSpravEditStandart;// возможно это не надо будет

  InicFormCaption      :=nFormPRK_SP_KAT_PRI_D_Caption[IndexLanguage];

  //CheckAccessAdd    :='';
  //CheckAccessChange :='';
  //CheckAccessDel    :='';
end;

end.
