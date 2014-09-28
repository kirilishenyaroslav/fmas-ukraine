unit uPRK_SP_ISPIT_VEDOM_TYPE;

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
  TFormPRK_SP_ISPIT_VEDOM_TYPE = class(TFormPrK_SpravOneLevel)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormPRK_SP_ISPIT_VEDOM_TYPE: TFormPRK_SP_ISPIT_VEDOM_TYPE;

implementation
uses
   uPrK_Resources,uConstants;
{$R *.dfm}

procedure TFormPRK_SP_ISPIT_VEDOM_TYPE.FormCreate(Sender: TObject);
begin
inherited;
  {ID_NAME должен стоять первым так как в SelectSQLText может делаться CloseOpen}
  ID_NAME              :='ID_SP_ISPIT_VEDOM_TYPE';
  SelectSQLText        :='Select * from PRK_SP_ISPIT_VEDOM_TYPE_SELECT';
  ShowNpp              := false;
  StoredProcAddName    :='PRK_SP_ISPIT_VEDOM_TYPE_ADD';
  StoredProcChangeName :='PRK_SP_ISPIT_VEDOM_TYPE_CHANGE';
  StoredProcDelName    :='PRK_SP_ISPIT_VEDOM_TYPE_DEL';

  InicFormCaption      :=nFormPRK_SP_ISPIT_VEDOM_TYPE_Caption[IndexLanguage];

  //CheckAccessAdd    :='';
  //CheckAccessChange :='';
  //CheckAccessDel    :='';
end;

end.
