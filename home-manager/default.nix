{ config, pkgs, ... }:

{
	imports = [
		./core
		./dev
		./media
		./services
		./shell
		./theming
		./overlays
		./ui
		./util
	];
}
