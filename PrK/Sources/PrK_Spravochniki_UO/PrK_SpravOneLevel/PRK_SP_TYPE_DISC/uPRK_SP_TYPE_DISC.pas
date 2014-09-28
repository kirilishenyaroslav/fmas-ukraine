unit uPRK_SP_TYPE_DISC;

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
  TFormPRK_SP_TYPE_DISC = class(TFormPrK_SpravOneLevel)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormPRK_SP_TYPE_DISC: TFormPRK_SP_TYPE_DISC;

implementation

{$R *.dfm}

uses uPrK_Resources,uConstants;

procedure TFormPRK_SP_TYPE_DISC.FormCreate(Sender: TObject);
begin
  inherited;
{ID_NAME должен стоять первым так как в SelectSQLText может делаться CloseOpen}
  ID_NAME              :='ID_SP_TYPE_DISC';
  SelectSQLText        :='Select * from UO_SP_TYPE_DISC_S';
  ShowNpp              := false;
  StoredProcAddName    :='UO_SP_TYPE_DISC_I';
  StoredProcChangeName :='UO_SP_TYPE_DISC_U';
  StoredProcDelName    :='UO_SP_TYPE_DISC_D';
  NamePrKSpravEdit     := PrKSpravEditStandart;// возможно это не надо будет

  InicFormCaption      :=nFormPRK_SP_TYPE_DISC_Caption[IndexLanguage];

  //CheckAccessAdd    :='';
  //CheckAccessChange :='';
  //CheckAccessDel    :='';
end;

end.
