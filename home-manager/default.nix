{ config, pkgs, ... }:

{
	imports = [
		./core
		./dev
		./media
		./services
		./shell
		./theming
		./ui
		./util
	];
}
