<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** MySQL database username */
define( 'DB_USER', 'hakam' );

/** MySQL database password */
define( 'DB_PASSWORD', 'hakam' );

/** MySQL hostname */
define( 'DB_HOST', '10.99.99.99' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8mb4' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',         '[!#uR:>s{D&$NB%SbWPmrE:k;[(]ct>:^Y-^XiT/_5M!6 .YB1<rxb&dAF|NS40k' );
define( 'SECURE_AUTH_KEY',  'x,Zn-K{qE3sGWSAqhQz+Q&<nnk#}0TE+ON)(Bm.`L)htT-UrBt `=fBU[c}*D;aO' );
define( 'LOGGED_IN_KEY',    '-;9dkljLLu)RNd()Pg$}b4|Wuyqguy2Bq^/R%w{sROk):.U/MS>YxkMi>/p6R*<m' );
define( 'NONCE_KEY',        '47`!?0}J#4Fe^k;Xs#[3q=<Oe43<]v=ng=d+|KS6Pf+};EMZY.Hj&+8C9eNDwepN' );
define( 'AUTH_SALT',        '2YMo.*}u$Lh7.20[pkJJnGI[M4FA;L!;6R lp]MCJ=a- tL>YN.-6bo1(<zv4~s#' );
define( 'SECURE_AUTH_SALT', 'z5A0,lE$XiV51(pxQLrL;6t%a5B.1{HmcXmnU]7~-By}k4|d*NEIA)TXNO^BzkYe' );
define( 'LOGGED_IN_SALT',   '&I+S@N=52+vZy5]G}~(api!efs8fObe:lHsr3FLjCmFcu_4_[.;_mt)I)]zOiOSn' );
define( 'NONCE_SALT',       ',,*A52|]><J)kHBJ{=]5+O=j~!M?[5U8zmSd)MBK%<8);k*a]3iAE8%]*Ld[T:Vx' );

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
